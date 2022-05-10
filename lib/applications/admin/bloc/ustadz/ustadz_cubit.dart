import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sibaba/applications/admin/models/ustadz_detail.dart';
import 'package:sibaba/applications/admin/repositories/ustadz_repo.dart';

import '../../models/ustadz.dart';

part 'ustadz_state.dart';
part 'ustadz_cubit.freezed.dart';

@injectable
class UstadzCubit extends Cubit<UstadzState> {
  UstadzCubit(this._ustadzRepo) : super(const UstadzState.initial());

  final UstadzRepo _ustadzRepo;

  List<Ustadz> ustadz = [];

  final searchKeyword = TextEditingController();

  String kapanewon = '';

  void refresh() {
    kapanewon = '';
  }

  void getUstadzs() async {
    emit(const UstadzState.loading());
    final ustadzs = await _ustadzRepo.getUstadz();
    ustadzs.fold(
      (l) => emit(UstadzState.error(l.message)),
      (r) {
        ustadz = r;
        emit(UstadzState.loaded(r));
      },
    );
  }

  void getDetailUstadzs(int ustadzId) async {
    emit(const UstadzState.loading());
    final ustadzs = await _ustadzRepo.getUstadzDetail(ustadzId);
    ustadzs.fold(
      (l) => emit(UstadzState.error(l.message)),
      (r) => emit(UstadzState.detailLoaded(r)),
    );
  }

  void deleteUstadz(int ustadzId) async {
    emit(const UstadzState.loading());
    final ustadzs = await _ustadzRepo.deleteUstadz(ustadzId);
    ustadzs.fold(
      (l) => emit(UstadzState.error(l.message)),
      (r) => emit(const UstadzState.success()),
    );
  }

  void searchInfoLokasi() async {
    emit(const UstadzState.loading());
    if (searchKeyword.text.isEmpty) {
      emit(UstadzState.loaded(ustadz));
    } else {
      final filteredUstadz = ustadz
          .where(
            (element) => element.nama
                .toLowerCase()
                .contains(searchKeyword.text.toLowerCase()),
          )
          .toList();

      emit(UstadzState.loaded(filteredUstadz));
    }
  }

  void filterInfoLokasi(String kapanewon) async {
    emit(const UstadzState.loading());
    if (kapanewon.isEmpty) {
      emit(UstadzState.loaded(ustadz));
    } else {
      this.kapanewon = kapanewon;
      final locations = await _ustadzRepo.getUstadz();
      locations.fold(
        (l) => emit(UstadzState.error(l.message)),
        (r) {
          ustadz.clear();
          ustadz = r;
          emit(UstadzState.loaded(r));
        },
      );
      final filteredUstadz = ustadz.where(
        (element) {
          return element.location.areaUnit.toLowerCase().contains(
                kapanewon.toLowerCase(),
              );
        },
      ).toList();
      kapanewon = '';
      ustadz = filteredUstadz;
      emit(UstadzState.loaded(filteredUstadz));
    }
  }
}
