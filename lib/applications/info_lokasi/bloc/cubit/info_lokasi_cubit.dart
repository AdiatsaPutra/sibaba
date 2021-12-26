import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:sibaba/applications/info_lokasi/model/location.dart';
import 'package:sibaba/applications/info_lokasi/repository/location_repo.dart';

part 'info_lokasi_state.dart';
part 'info_lokasi_cubit.freezed.dart';

@injectable
class InfoLokasiCubit extends Cubit<InfoLokasiState> {
  InfoLokasiCubit(this._locationRepo) : super(const InfoLokasiState.initial());

  final LocationRepo _locationRepo;

  List<Location> locationList = [];
  final searchKeyword = TextEditingController();

  void getLocations() async {
    final locations = await _locationRepo.getLocations();
    Logger().wtf(locations);
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

  @override
  void onError(Object error, StackTrace stackTrace) {
    InfoLokasiState.error(error.toString());
    super.onError(error, stackTrace);
  }
}
