import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sibaba/models/kapanewon_model.dart';
import 'package:sibaba/repositories/api_repository.dart';

part 'kapanewon_state.dart';

class KapanewonCubit extends Cubit<KapanewonState> {
  final ApiRepository apiRepository;
  KapanewonCubit(this.apiRepository) : super(KapanewonInitial());

  Future<void> getKapanewon() async {
    try {
      List<KapanewonModel> kapanewonModel = await apiRepository.getKapanewon();
      emit(KapanewonFetched(kapanewonModel));
    } catch (e) {
      emit(KapanewonError(e.toString()));
    }
  }

  Future<void> addKapanewon({
    required String areaName,
    required String kodeArea,
  }) async {
    try {
      await apiRepository.addKapanewon(areaName: areaName, kodeArea: kodeArea);
    } catch (e) {
      emit(KapanewonError(e.toString()));
    }
  }

  Future<void> deleteKapanewon(int id) async {
    try {
      await apiRepository.deleteKapanewon(id);
      List<KapanewonModel> kapanewonModel = await apiRepository.getKapanewon();
      emit(KapanewonFetched(kapanewonModel));
    } catch (e) {
      emit(KapanewonError(e.toString()));
    }
  }
}
