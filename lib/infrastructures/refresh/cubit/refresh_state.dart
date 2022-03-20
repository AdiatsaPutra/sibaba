part of 'refresh_cubit.dart';

@freezed
class RefreshState with _$RefreshState {
  const factory RefreshState.initial() = _Initial;
  const factory RefreshState.loading() = _Loaded;
  const factory RefreshState.locationAdded() = _LocationAdded;
}
