part of 'add_ustadz_cubit.dart';

@freezed
class AddUstadzState with _$AddUstadzState {
  const factory AddUstadzState.initial() = _Initial;
  const factory AddUstadzState.loading() = _Loading;
  const factory AddUstadzState.loaded() = _Loaded;
  const factory AddUstadzState.success() = _Success;
  const factory AddUstadzState.error(String message) = _Error;
}
