import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:sibaba/applications/admin/models/kelurahan.dart';
import 'package:sibaba/applications/admin/repositories/kelurahan_repo.dart';

part 'add_kelurahan_state.dart';
part 'add_kelurahan_cubit.freezed.dart';

@injectable
class AddKelurahanCubit extends Cubit<AddKelurahanState> {
  AddKelurahanCubit(this._kelurahanRepo)
      : super(const AddKelurahanState.initial());

  final KelurahanRepo _kelurahanRepo;

  final key = GlobalKey<FormState>();

  final name = TextEditingController();

  int kapanewonId = 0;

  void init(Kelurahan kelurahan) {
    kapanewonId = kelurahan.areaId;
    name.text = kelurahan.districtName;
  }

  void setKapanewon(int kapanewonId) {
    emit(const AddKelurahanState.loading());
    this.kapanewonId = kapanewonId;
    Logger().i(this.kapanewonId);
    emit(const AddKelurahanState.loaded());
  }

  void addKelurahan() async {
    emit(const AddKelurahanState.loading());
    final kelurahan = await _kelurahanRepo.addKelurahan(
      kapanewonId,
      name.text,
    );
    kelurahan.fold(
      (l) => emit(AddKelurahanState.error(l.message)),
      (r) => emit(const AddKelurahanState.added()),
    );
  }

  void updateKelurahan(int id) async {
    emit(const AddKelurahanState.loading());
    final kelurahan =
        await _kelurahanRepo.updateKelurahan(kapanewonId, name.text, id);
    kelurahan.fold(
      (l) => emit(AddKelurahanState.error(l.message)),
      (r) => emit(const AddKelurahanState.updated()),
    );
  }
}
