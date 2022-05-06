import 'package:bloc/bloc.dart';
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

  void getUstadzs() async {
    emit(const UstadzState.loading());
    final ustadzs = await _ustadzRepo.getUstadz();
    ustadzs.fold(
      (l) => emit(UstadzState.error(l.message)),
      (r) => emit(UstadzState.loaded(r)),
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
}
