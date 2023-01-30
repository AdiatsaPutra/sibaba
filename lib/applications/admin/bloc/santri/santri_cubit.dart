import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sibaba/applications/admin/repositories/santri_repo.dart';

import '../../models/santri.dart';

part 'santri_state.dart';
part 'santri_cubit.freezed.dart';

@injectable
class SantriCubit extends Cubit<SantriState> {
  SantriCubit(this._santriRepo) : super(const SantriState.initial());

  final SantriRepo _santriRepo;

  List<Santri> santri = [];
  List<Santri> santriT = [];

  final key = GlobalKey<FormState>();

  final wilayah = TextEditingController();
  final unit = TextEditingController();
  final tahunAjaran = TextEditingController();

  int? santriId;

  bool isEdit = false;

  File? fileSantri;

  void init(Santri? santri) {
    if (santri != null) {
      santriId = santri.id;
      isEdit = true;
      wilayah.text = santri.wilayah;
      unit.text = santri.unit;
      tahunAjaran.text = santri.tahunAjaran;
    }
  }

  void setFile() async {
    emit(const SantriState.loading());
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      fileSantri = File(result.files.single.path!);
    }
    emit(const SantriState.loaded());
  }

  void getSantri() async {
    emit(const SantriState.loading());
    final ustadzs = await _santriRepo.getSantri();
    ustadzs.fold(
      (l) => emit(SantriState.error(l.message)),
      (r) {
        santri.clear();
        santri = r;
        santriT = r;
        emit(SantriState.success(santri));
      },
    );
  }

  void search(String search) async {
    emit(const SantriState.loading());
    final ustadzs = await _santriRepo.getSantri();
    ustadzs.fold(
      (l) => emit(SantriState.error(l.message)),
      (r) {
        if (search.isNotEmpty) {
          santri.clear();
          santri = r
              .where((element) =>
                  element.unit.toLowerCase().contains(search.toLowerCase()))
              .toList();
          emit(SantriState.success(santri));
        } else {
          getSantri();
        }
      },
    );
  }
 
  void downloadSantri(int santriId) async {
    // emit(const SantriState.loading());
    await _santriRepo.downloadSantri(santriId);
    // ustadzs.fold(
    //   (l) => emit(SantriState.error(l.message)),
    //   (r) => emit(const SantriState.loaded()),
    // );
  }

  void addSantri(int userId) async {
    emit(const SantriState.loading());
    final ustadzs = await _santriRepo.addSantri(
      userId,
      wilayah.text,
      unit.text,
      tahunAjaran.text,
      fileSantri!,
    );
    ustadzs.fold(
      (l) => emit(SantriState.error(l.message)),
      (r) => emit(const SantriState.added()),
    );
  }

  void updateSantri(int santriId) async {
    emit(const SantriState.loading());
    final ustadzs = await _santriRepo.editSantri(
      santriId,
      wilayah.text,
      unit.text,
      tahunAjaran.text,
      fileSantri,
    );
    ustadzs.fold(
      (l) => emit(SantriState.error(l.message)),
      (r) => emit(const SantriState.deleted()),
    );
  }

  void deleteSantri(int id) async {
    emit(const SantriState.loading());
    final ustadzs = await _santriRepo.deleteSantri(id);
    ustadzs.fold(
      (l) => emit(SantriState.error(l.message)),
      (r) => emit(const SantriState.deleted()),
    );
  }
}
