import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../../models/request/kontak_request.dart';
import '../../repository/kontak_kami_repo.dart';

part 'update_kontak_state.dart';
part 'update_kontak_cubit.freezed.dart';

@injectable
class UpdateKontakCubit extends Cubit<UpdateKontakState> {
  UpdateKontakCubit(this._kontakKamiRepo)
      : super(const UpdateKontakState.initial());

  final KontakKamiRepo _kontakKamiRepo;

  final formKey = GlobalKey<FormState>();

  final alamat = TextEditingController();
  final linkMaps = TextEditingController();
  final telepon = TextEditingController();
  final emailBadko = TextEditingController();
  final jamMasuk = TextEditingController();
  final jamKeluar = TextEditingController();

  String hariMasuk1 = '';
  String hariMasuk2 = '';

  void setHari1(String hariMasuk) {
    emit(const UpdateKontakState.loading());
    Logger().i(hariMasuk);
    hariMasuk1 = hariMasuk;
    emit(const UpdateKontakState.loaded());
  }

  void setHari2(String hariMasuk) {
    emit(const UpdateKontakState.loading());
    hariMasuk2 = hariMasuk;
    emit(const UpdateKontakState.loaded());
  }

  void updateKontak() async {
    emit(const UpdateKontakState.loading());
    final kontakRequest = KontakRequest(
      alamat: alamat.text,
      linkmaps: linkMaps.text,
      telpon: telepon.text,
      email: emailBadko.text,
      hari1: hariMasuk1,
      hari2: hariMasuk2,
      masukJam: jamMasuk.text,
      selesaiJam: jamKeluar.text,
    );
    final kontakKami = await _kontakKamiRepo.updateKontak(kontakRequest);
    kontakKami.fold(
      (l) => emit(UpdateKontakState.error(l.message)),
      (r) => emit(const UpdateKontakState.success()),
    );
  }
}
