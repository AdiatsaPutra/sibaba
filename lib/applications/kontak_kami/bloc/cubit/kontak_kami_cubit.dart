import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sibaba/applications/kontak_kami/models/info_kontak.dart';
import 'package:sibaba/applications/kontak_kami/repository/kontak_kami_repo.dart';

part 'kontak_kami_state.dart';
part 'kontak_kami_cubit.freezed.dart';

@injectable
class KontakKamiCubit extends Cubit<KontakKamiState> {
  KontakKamiCubit(this._kontakKamiRepo)
      : super(const KontakKamiState.initial());

  final KontakKamiRepo _kontakKamiRepo;

  void getKontakKami() async {
    emit(const KontakKamiState.loading());
    final kontakKami = await _kontakKamiRepo.getKontakKami();
    kontakKami.fold(
      (l) => emit(KontakKamiState.error(l.message)),
      (r) => emit(KontakKamiState.loaded(r)),
    );
  }
}
