part of 'update_kontak_cubit.dart';

@freezed
class UpdateKontakState with _$UpdateKontakState {
  const factory UpdateKontakState.initial() = _Initial;
  const factory UpdateKontakState.loading() = _Loading;
  const factory UpdateKontakState.loaded() = _Loaded;
  const factory UpdateKontakState.success() = _Success;
  const factory UpdateKontakState.error(String message) = _Error;
}
