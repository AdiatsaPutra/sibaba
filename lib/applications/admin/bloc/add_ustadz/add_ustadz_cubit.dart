import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:sibaba/applications/admin/models/request/ustadz_request.dart';
import 'package:sibaba/applications/admin/models/ustadz_detail.dart';
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

  int locationId = 0;

  String jenisKelamin = '';
  String tanggalLahir = '';
  String status = '';

  void init(DetailUstadz detailUstadz) {
    nama.text = detailUstadz.ustadzs.nama;
    tempatLahir.text = detailUstadz.ustadzs.tmpLahir;
    alamatLengkap.text = detailUstadz.ustadzs.alamat;
    noHp.text = detailUstadz.ustadzs.telpon!;
    email.text = detailUstadz.ustadzs.email!;
    mulaiMengajar.text = detailUstadz.ustadzs.mulaiUstadz;
// lokasi.text = detailUstadz.ustadzs.;
    locationId = detailUstadz.ustadzs.locId;

    jenisKelamin = detailUstadz.ustadzs.gender;
    tanggalLahir = detailUstadz.ustadzs.tglLahir.toString();
    status = detailUstadz.status.status;

    tk.text = detailUstadz.pendidikans.tk!;
    tahuntk.text = detailUstadz.pendidikans.tkLulus!;
    sd.text = detailUstadz.pendidikans.sd!;
    tahunsd.text = detailUstadz.pendidikans.sdLulus!;
    smp.text = detailUstadz.pendidikans.smp!;
    tahunsmp.text = detailUstadz.pendidikans.smpLulus!;
    sma.text = detailUstadz.pendidikans.sma!;
    tahunsma.text = detailUstadz.pendidikans.smaLulus!;
    perguruantinggi.text = detailUstadz.pendidikans.pt!;
    tahunperguruantinggi.text = detailUstadz.pendidikans.ptLulus!;

    dasar.text = detailUstadz.pelatihans.dasar!;
    mahir.text = detailUstadz.pelatihans.mahir1!;
    mahir2.text = detailUstadz.pelatihans.mahir2!;
    tot.text = detailUstadz.pelatihans.tot!;

    s1.text = detailUstadz.sertifikasis.s1!;
    s2a.text = detailUstadz.sertifikasis.s2A!;
    s2b.text = detailUstadz.sertifikasis.s2B!;
    s2c.text = detailUstadz.sertifikasis.s2C!;
    s3.text = detailUstadz.sertifikasis.s3!;
  }

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

  void addUstadz(File file, int userId) async {
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
    final result = await _ustadzRepo.addUstadzs(file, ustadzRequest);
    result.fold(
      (l) => emit(AddUstadzState.error(l.message)),
      (r) => emit(const AddUstadzState.success()),
    );
  }
}
