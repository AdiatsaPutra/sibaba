import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sibaba/models/tentang_model.dart';
import 'package:sibaba/repositories/api_repository.dart';

part 'tentang_state.dart';

class TentangCubit extends Cubit<TentangState> {
  final ApiRepository apiRepository;
  TentangCubit(this.apiRepository) : super(TentangInitial());

  Future<void> getTentang() async {
    try {
      TentangModel tentangModel = await apiRepository.getTentang();
      emit(TentangFetched(tentangModel));
    } catch (e) {
      emit(TentangError(e.toString()));
    }
  }
}
