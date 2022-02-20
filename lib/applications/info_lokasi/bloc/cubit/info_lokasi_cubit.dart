import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:injectable/injectable.dart';
import 'package:sibaba/applications/info_lokasi/model/location.dart';
import 'package:sibaba/applications/info_lokasi/model/location_detail.dart';
import 'package:sibaba/applications/info_lokasi/model/request/location_request.dart';
import 'package:sibaba/applications/info_lokasi/repository/location_repo.dart';

part 'info_lokasi_state.dart';
part 'info_lokasi_cubit.freezed.dart';

@injectable
class InfoLokasiCubit extends Cubit<InfoLokasiState> {
  InfoLokasiCubit(this._locationRepo) : super(const InfoLokasiState.initial());

  final LocationRepo _locationRepo;

  List<Location> locationList = [];
  final searchKeyword = TextEditingController();

  final nspq = TextEditingController();
  final nama = TextEditingController();
  final alamat = TextEditingController();
  final telepon = TextEditingController();
  final sk = TextEditingController();
  final tempatBelajar = TextEditingController();
  final email = TextEditingController();
  final akreditasi = TextEditingController();
  final tanggalBerdiri = TextEditingController();
  final direktur = TextEditingController();
  final tanggalAkreditasi = TextEditingController();
  final status = TextEditingController();
  final deskripsi = HtmlEditorController();
  final hariMasuk = TextEditingController();
  final jamMasuk = TextEditingController();
  final jamKeluar = TextEditingController();

  void init({LocationDetail? l}) {
    nspq.text = l!.detailLokasi.nspq;
    nama.text = l.detailLokasi.nama;
    alamat.text = l.detailLokasi.alamat;
    telepon.text = l.detailLokasi.telpUnit;
    sk.text = l.detailLokasi.skPendirian;
    tempatBelajar.text = l.detailLokasi.tmpBelajar;
    email.text = l.detailLokasi.email;
    akreditasi.text = l.detailLokasi.akreditasi;
    tanggalAkreditasi.text = l.detailLokasi.tglAkreditasi.toString();
    direktur.text = l.detailLokasi.direktur;
    tanggalBerdiri.text = l.detailLokasi.tglBerdiri.toString();
    status.text = l.detailLokasi.status;
    // deskripsi.text = locationRequest.deskripsi;
    // status.text = locationRequest.status;
  }

  void getLocations() async {
    emit(const InfoLokasiState.loading());
    final locations = await _locationRepo.getLocations();
    locations.fold(
      (l) => locationList.clear(),
      (r) => locationList.addAll(r),
    );
    emit(InfoLokasiState.loaded(locationList));
  }

  void searchInfoLokasi() {
    emit(const InfoLokasiState.loading());
    if (searchKeyword.text.isEmpty) {
      emit(InfoLokasiState.loaded(locationList));
    } else {
      final filteredLokasi = locationList
          .where(
            (element) => element.nama!
                .toLowerCase()
                .contains(searchKeyword.text.toLowerCase()),
          )
          .toList();
      emit(InfoLokasiState.loaded(filteredLokasi));
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

  @override
  void onError(Object error, StackTrace stackTrace) {
    InfoLokasiState.error(error.toString());
    super.onError(error, stackTrace);
  }
}
