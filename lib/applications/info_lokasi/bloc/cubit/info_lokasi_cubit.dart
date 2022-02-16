import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sibaba/applications/info_lokasi/model/location.dart';
import 'package:sibaba/applications/info_lokasi/model/location_detail.dart';
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
    emit(const InfoLokasiState.loading());
    final locations = await _locationRepo.getLocations();
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

  void getLocationDetail(String slug) async {
    emit(const InfoLokasiState.loading());
    final locationDetail = await _locationRepo.getLocationDetail(slug);
    locationDetail.fold(
      (l) => emit(InfoLokasiState.error(l.message)),
      (r) => emit(InfoLokasiState.detailLoaded(r)),
    );
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    InfoLokasiState.error(error.toString());
    super.onError(error, stackTrace);
  }
}
