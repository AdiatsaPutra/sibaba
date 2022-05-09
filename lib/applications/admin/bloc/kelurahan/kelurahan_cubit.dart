import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:sibaba/applications/admin/models/kelurahan.dart';

import '../../repositories/kelurahan_repo.dart';

part 'kelurahan_state.dart';
part 'kelurahan_cubit.freezed.dart';

@injectable
class KelurahanCubit extends Cubit<KelurahanState> {
  KelurahanCubit(this._kelurahanRepo) : super(const KelurahanState.initial());

  final KelurahanRepo _kelurahanRepo;

  List<Kelurahan> kelurahanList = [];

  final searchKeyword = TextEditingController();

  void getKelurahan() async {
    emit(const KelurahanState.loading());
    final kapanewon = await _kelurahanRepo.getKelurahan();
    kapanewon.fold(
      (l) => emit(KelurahanState.error(l.message)),
      (r) {
        kelurahanList = r;
        emit(KelurahanState.loaded(kelurahanList));
      },
    );
  }

  void searchKelurahan() {
    emit(const KelurahanState.loading());
    if (searchKeyword.text.isEmpty) {
      emit(KelurahanState.loaded(kelurahanList));
    } else {
      Logger().i(searchKeyword.text.toLowerCase());
      final filteredkelurahan = kelurahanList
          .where((element) => element.districtName
              .toLowerCase()
              .contains(searchKeyword.text.toLowerCase()))
          .toList();
      emit(KelurahanState.loaded(filteredkelurahan));
    }
  }

  void deleteKelurahan(int id) async {
    emit(const KelurahanState.loading());
    final kapanewon = await _kelurahanRepo.deleteKelurahan(id);
    kapanewon.fold(
      (l) => emit(KelurahanState.error(l.message)),
      (r) => emit(const KelurahanState.deleted()),
    );
  }
}
