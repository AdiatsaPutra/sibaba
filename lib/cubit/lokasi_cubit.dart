import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sibaba/applications/info_lokasi/model/location.dart';
import 'package:sibaba/repositories/api_repository.dart';

part 'lokasi_state.dart';

class LokasiCubit extends Cubit<LokasiState> {
  final ApiRepository apiRepository;
  LokasiCubit(this.apiRepository) : super(LokasiInitial());

  Future<void> getLokasi() async {
    try {
      List<Location> lokasi = await apiRepository.getAllLokasi();
      emit(LokasiFetched(lokasi));
    } catch (e) {
      emit(LokasiError(e.toString()));
    }
  }
}
