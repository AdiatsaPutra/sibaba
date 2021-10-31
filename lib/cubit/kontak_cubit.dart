import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sibaba/models/kontak_model.dart';
import 'package:sibaba/repositories/api_repository.dart';

part 'kontak_state.dart';

class KontakCubit extends Cubit<KontakState> {
  final ApiRepository apiRepository;
  KontakCubit(this.apiRepository) : super(KontakInitial());

  Future<void> getKontak() async {
    try {
      KontakModel kontakModel = await apiRepository.getKontak();
      emit(KontakFetched(kontakModel));
    } catch (e) {
      emit(KontakError(e.toString()));
    }
  }
}
