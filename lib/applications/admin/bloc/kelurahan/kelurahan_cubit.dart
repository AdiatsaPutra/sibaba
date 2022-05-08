import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sibaba/applications/admin/models/kelurahan.dart';

import '../../repositories/kelurahan_repo.dart';

part 'kelurahan_state.dart';
part 'kelurahan_cubit.freezed.dart';

@injectable
class KelurahanCubit extends Cubit<KelurahanState> {
  KelurahanCubit(this._kelurahanRepo) : super(const KelurahanState.initial());

  final KelurahanRepo _kelurahanRepo;

  List<Kelurahan> kapanewonList = [];

  final searchKeyword = TextEditingController();

  void getKelurahan() async {
    emit(const KelurahanState.loading());
    final kapanewon = await _kelurahanRepo.getKelurahan();
    kapanewon.fold(
      (l) => emit(KelurahanState.error(l.message)),
      (r) {
        kapanewonList = r;
        emit(KelurahanState.loaded(kapanewonList));
      },
    );
  }

  void searchKelurahan() {
    emit(const KelurahanState.loading());
    if (searchKeyword.text.isEmpty) {
      emit(KelurahanState.loaded(kapanewonList));
    } else {
      final filteredKapanewon = kapanewonList
          .where((element) => element.districtName
              .toLowerCase()
              .contains(searchKeyword.text.toLowerCase()))
          .toList();
      emit(KelurahanState.loaded(filteredKapanewon));
    }
  }
}
