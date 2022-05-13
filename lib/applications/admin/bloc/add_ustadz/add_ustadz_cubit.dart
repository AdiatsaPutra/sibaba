import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:sibaba/applications/admin/models/request/ustadz_request.dart';
import 'package:sibaba/applications/admin/repositories/ustadz_repo.dart';

part 'add_ustadz_state.dart';
part 'add_ustadz_cubit.freezed.dart';

@injectable
class AddUstadzCubit extends Cubit<AddUstadzState> {
  AddUstadzCubit(this._ustadzRepo) : super(const AddUstadzState.initial());

  final UstadzRepo _ustadzRepo;

  final nama = TextEditingController();
  final tempatLahir = TextEditingController();
  final alamatLengkap = TextEditingController();
  final noHp = TextEditingController();
  final email = TextEditingController();
  final mulaiMengajar = TextEditingController();
  final lokasi = TextEditingController();

  final tk = TextEditingController();
  final tahuntk = TextEditingController();
  final sd = TextEditingController();
  final tahunsd = TextEditingController();
  final smp = TextEditingController();
  final tahunsmp = TextEditingController();
  final sma = TextEditingController();
  final tahunsma = TextEditingController();
  final perguruantinggi = TextEditingController();
  final tahunperguruantinggi = TextEditingController();

  final dasar = TextEditingController();
  final mahir = TextEditingController();
  final mahir2 = TextEditingController();
  final tot = TextEditingController();

  final s1 = TextEditingController();
  final s2a = TextEditingController();
  final s2b = TextEditingController();
  final s2c = TextEditingController();
  final s3 = TextEditingController();

  String jenisKelamin = '';
  String tanggalLahir = '';
  String status = '';

  void setLokasi(String value) {
    emit(const AddUstadzState.loading());
    lokasi.text = value;
    emit(const AddUstadzState.loaded());
  }

  void setjenisKelamin(String value) {
    emit(const AddUstadzState.loading());
    jenisKelamin = value;
    emit(const AddUstadzState.loaded());
  }

  void setTanggalLahir(DateTime value) {
    emit(const AddUstadzState.loading());
    tanggalLahir = value.toString();
    emit(const AddUstadzState.loaded());
  }

  void setStatus(String value) {
    emit(const AddUstadzState.loading());
    status = value;
    emit(const AddUstadzState.loaded());
  }

  void addUstadz(int userId) async {
    emit(const AddUstadzState.loading());
    final ustadzRequest = UstadzRequest(
      userId: userId,
      locationName: lokasi.text,
      nama: nama.text,
      gender: jenisKelamin,
      tmpLahir: tempatLahir.text,
      tglLahir: tanggalLahir,
      alamat: alamatLengkap.text,
      telpon: noHp.text,
      email: email.text,
      mulaiUstadz: mulaiMengajar.text,
      status: status,
      tAjar: lokasi.text,
      tk: tk.text,
      tkLulus: tahuntk.text,
      sd: sd.text,
      sdLulus: tahunsd.text,
      smp: smp.text,
      smpLulus: tahunsmp.text,
      sma: sma.text,
      smaLulus: tahunsma.text,
      pt: perguruantinggi.text,
      ptLulus: tahunperguruantinggi.text,
      dasar: dasar.text,
      mahir1: mahir.text,
      mahir2: mahir2.text,
      tot: tot.text,
      s1: s1.text,
      s2A: s2a.text,
      s2B: s2b.text,
      s2C: s2c.text,
      s3: s3.text,
    );
    Logger().i(ustadzRequest);
    final result = await _ustadzRepo.addUstadzs(ustadzRequest);
    result.fold(
      (l) => emit(AddUstadzState.error(l.message)),
      (r) => emit(const AddUstadzState.success()),
    );
  }
}
