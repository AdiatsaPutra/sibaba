part of 'edit_tentang_kami_cubit.dart';

@freezed
class EditTentangKamiState with _$EditTentangKamiState {
  const factory EditTentangKamiState.initial() = _Initial;
  const factory EditTentangKamiState.loading() = _Loading;
  const factory EditTentangKamiState.loaded() = _Loaded;
  const factory EditTentangKamiState.success() = _Success;
  const factory EditTentangKamiState.error(String message) = _Error;
}
