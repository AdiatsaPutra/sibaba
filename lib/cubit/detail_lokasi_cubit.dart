import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sibaba/models/lokasi_detail_model.dart';
import 'package:sibaba/repositories/api_repository.dart';

part 'detail_lokasi_state.dart';

class DetailLokasiCubit extends Cubit<DetailLokasiState> {
  final ApiRepository apiRepository;
  DetailLokasiCubit(this.apiRepository) : super(DetailLokasiInitial());

  Future<void> getDetailLokasi(String? slug) async {
    try {
      LokasiDetailModel lokasiDetail =
          await apiRepository.getDetailLokasi(slug!);
      emit(DetailLokasiFetched(lokasiDetail));
    } catch (e) {
      emit(DetailLokasiError(e.toString()));
    }
  }
}
