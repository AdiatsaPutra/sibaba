import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:sibaba/applications/info_lokasi/model/location.dart';
import 'package:sibaba/applications/info_lokasi/model/location_detail.dart';
import 'package:sibaba/applications/info_lokasi/model/request/location_request.dart';
import 'package:intl/intl.dart';
import 'package:sibaba/applications/info_lokasi/repository/location_repo.dart';

part 'info_lokasi_state.dart';
part 'info_lokasi_cubit.freezed.dart';

@injectable
class InfoLokasiCubit extends Cubit<InfoLokasiState> {
  InfoLokasiCubit(this._locationRepo) : super(const InfoLokasiState.initial());

  final LocationRepo _locationRepo;

  Location location = Location(
    lokasi: [],
    maps: [],
    events: [],
  );
  List<Lokasi> locationList = [];
  final searchKeyword = TextEditingController();

  List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];

  final nspq = TextEditingController();
  final nama = TextEditingController();
  final alamat = TextEditingController();
  final telepon = TextEditingController();
  final sk = TextEditingController();
  final tempatBelajar = TextEditingController();
  final email = TextEditingController();
  final tanggalBerdiri = TextEditingController();
  final direktur = TextEditingController();
  final tanggalAkreditasi = TextEditingController();
  final deskripsi = HtmlEditorController();
  final jamMasuk = TextEditingController();
  final jamKeluar = TextEditingController();
  final lat = TextEditingController();
  final lng = TextEditingController();

  DateTime? tglBerdiri;
  DateTime? tglAkreditasi;
  DateTime? jmMasuk;
  DateTime? jmKeluar;

  int kapanewonId = 0;
  int kelurahanId = 0;

  String kapanewon = '';
  String kelurahan = '';
  String status = '';
  String akreditasi = '';
  String hariMasuk = '';
  String deskripsiText = '';

  void setLocation(LatLng latLng) {
    lat.text = latLng.latitude.toString();
    lng.text = latLng.longitude.toString();
  }

  void refresh() {
    kapanewon = '';
  }

  void init({LocationDetail? l}) {
    nspq.text = l!.detailLokasi.nspq;
    nama.text = l.detailLokasi.nama;
    alamat.text = l.detailLokasi.alamat;
    telepon.text = l.detailLokasi.telpUnit;
    sk.text = l.detailLokasi.skPendirian;
    tempatBelajar.text = l.detailLokasi.tmpBelajar;
    email.text = l.detailLokasi.email;
    akreditasi = l.detailLokasi.akreditasi;
    tanggalAkreditasi.text = l.detailLokasi.tglAkreditasi.toString();
    direktur.text = l.detailLokasi.direktur;
    tanggalBerdiri.text = l.detailLokasi.tglBerdiri.toString();
    status = l.detailLokasi.status;
    deskripsiText = l.detailLokasi.deskripsi;
    status = l.detailLokasi.status;
    tanggalBerdiri.text = l.detailLokasi.tglBerdiri.toString();
    tanggalAkreditasi.text = l.detailLokasi.tglAkreditasi.toString();
    hariMasuk = 'senin';
    jamMasuk.text = l.waktuMasuk;
    jamKeluar.text = l.waktuSelesai;
    kapanewon = l.detailLokasi.areaUnit;
    kapanewon = l.detailLokasi.areaUnit;
    kelurahan = l.detailLokasi.districtUnit;
    lat.text = l.maps.latitude.toString();
    lng.text = l.maps.longitude.toString();
  }

  void initKapanewon(int kapanewonId) {
    emit(const InfoLokasiState.loading());
    this.kapanewonId = kapanewonId;
    emit(const InfoLokasiState.picked());
  }

  void setKapanewon(int kapanewonId) {
    emit(const InfoLokasiState.loading());
    this.kapanewonId = kapanewonId;
    emit(const InfoLokasiState.picked());
  }

  void setKelurahan(int kelurahanId) {
    emit(const InfoLokasiState.loading());
    this.kelurahanId = kelurahanId;
    emit(const InfoLokasiState.picked());
  }

  void setAkreditasi(String value) {
    emit(const InfoLokasiState.loading());
    akreditasi = value;
    emit(const InfoLokasiState.picked());
  }

  void setStatus(String value) {
    emit(const InfoLokasiState.loading());
    status = value;
    emit(const InfoLokasiState.picked());
  }

  void setTanggalBerdiri(DateTime value) {
    emit(const InfoLokasiState.loading());
    final formattedDate = DateFormat('yyyy-MM-dd').format(value);
    tglBerdiri = DateTime.parse(formattedDate);
    tanggalBerdiri.text = formattedDate;
    emit(const InfoLokasiState.picked());
  }

  void setTanggalAkreditasi(DateTime value) {
    emit(const InfoLokasiState.loading());
    final formattedDate = DateFormat('yyyy-MM-dd').format(value);
    tglAkreditasi = DateTime.parse(formattedDate);
    tanggalAkreditasi.text = formattedDate;
    emit(const InfoLokasiState.picked());
  }

  void setHariMasuk(String value) {
    emit(const InfoLokasiState.loading());
    hariMasuk = value;
    emit(const InfoLokasiState.picked());
  }

  void setJamMasuk(DateTime value) {
    emit(const InfoLokasiState.loading());
    final formattedTime = DateFormat('hh:mm').format(value);
    jamMasuk.text = formattedTime;
    emit(const InfoLokasiState.picked());
  }

  void setJamKeluar(DateTime value) {
    emit(const InfoLokasiState.loading());
    final formattedTime = DateFormat('hh:mm').format(value);
    jamKeluar.text = formattedTime;
    emit(const InfoLokasiState.picked());
  }

  void getLokasi() async {
    emit(const InfoLokasiState.loading());
    final locations = await _locationRepo.getLocations();
    locations.fold(
      (l) => emit(InfoLokasiState.error(l.message)),
      (r) {
        locationList.clear();
        locationList = r.lokasi;
        location = r;
        emit(InfoLokasiState.loaded(r));
      },
    );
  }

  void searchInfoLokasi() async {
    emit(const InfoLokasiState.loading());
    if (searchKeyword.text.isEmpty) {
      locationList = location.lokasi;
      emit(InfoLokasiState.loaded(location));
    } else {
      final filteredLokasi = locationList
          .where(
            (element) => element.nama!
                .toLowerCase()
                .contains(searchKeyword.text.toLowerCase()),
          )
          .toList();
      var filteredLocation = Location(
        lokasi: filteredLokasi,
        maps: location.maps,
        events: location.events,
      );
      locationList = filteredLokasi;
      emit(InfoLokasiState.loaded(filteredLocation));
    }
  }

  void filterInfoLokasi(String kapanewon) async {
    emit(const InfoLokasiState.loading());
    if (kapanewon.isEmpty) {
      emit(InfoLokasiState.loaded(location));
    } else {
      this.kapanewon = kapanewon;
      final locations = await _locationRepo.getLocations();
      locations.fold(
        (l) => emit(InfoLokasiState.error(l.message)),
        (r) {
          locationList.clear();
          locationList = r.lokasi;
          location = r;
          emit(InfoLokasiState.loaded(r));
        },
      );
      final filteredLokasi = locationList.where(
        (element) {
          return element.areaUnit!.toLowerCase().contains(
                kapanewon.toLowerCase(),
              );
        },
      ).toList();
      var filteredLocation = Location(
        lokasi: filteredLokasi,
        maps: location.maps,
        events: location.events,
      );
      kapanewon = '';
      locationList = filteredLokasi;
      emit(InfoLokasiState.loaded(filteredLocation));
    }
  }

  void getLocationDetail(String slug) async {
    emit(const InfoLokasiState.loading());
    final locationDetail = await _locationRepo.getLocationDetail(slug);
    locationDetail.fold(
      (l) => emit(InfoLokasiState.error(l.message)),
      (r) => emit(InfoLokasiState.detailLoaded(r)),
    );
  }

  void addLokasi(String userId) async {
    final deskripsiText = await deskripsi.getText();
    emit(const InfoLokasiState.loading());
    final locationRequest = LocationRequest(
        userId: userId,
        nspq: nspq.text,
        areaUnit: kapanewonId,
        districtUnit: kelurahanId,
        nama: nama.text,
        locSlug: '',
        alamat: alamat.text,
        telpUnit: telepon.text,
        skPendirian: sk.text,
        tmpBelajar: tempatBelajar.text,
        email: email.text,
        akreditasi: akreditasi,
        tglBerdiri: DateTime.parse(tanggalBerdiri.text),
        direktur: direktur.text,
        tglAkreditasi: DateTime.parse(tanggalAkreditasi.text),
        status: status,
        deskripsi: deskripsiText,
        hariMasuk: hariMasuk,
        masuk: jamMasuk.text,
        selesai: jamKeluar.text,
        latitude: lat.text,
        longitude: lng.text);
    final location = await _locationRepo.addLocation(locationRequest);
    location.fold(
      (l) => emit(InfoLokasiState.error(l.message)),
      (r) => emit(const InfoLokasiState.added()),
    );
  }

  void deleteLokasi(int id) async {
    final location = await _locationRepo.deleteLocation(id);
    location.fold(
      (l) => emit(InfoLokasiState.error(l.message)),
      (r) => emit(const InfoLokasiState.deleted()),
    );
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    InfoLokasiState.error(error.toString());
    super.onError(error, stackTrace);
  }
}
