import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'add_ustadz_state.dart';
part 'add_ustadz_cubit.freezed.dart';

@injectable
class AddUstadzCubit extends Cubit<AddUstadzState> {
  AddUstadzCubit() : super(const AddUstadzState.initial());

  final nama = TextEditingController();
  final tempatLahir = TextEditingController();
  final alamatLengkap = TextEditingController();
  final noHp = TextEditingController();
  final email = TextEditingController();
  final mulaiMengajar = TextEditingController();
  final lokasi = TextEditingController();

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
}
