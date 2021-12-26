part of 'tentang_kami_cubit.dart';

@freezed
class TentangKamiState with _$TentangKamiState {
  const factory TentangKamiState.initial() = _Initial;
  const factory TentangKamiState.loading() = _Loading;
  const factory TentangKamiState.loaded(Tentang tentang) = _Loaded;
  const factory TentangKamiState.error(String message) = _Error;
}
