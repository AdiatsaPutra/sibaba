part of 'refresh_cubit.dart';

@freezed
class RefreshState with _$RefreshState {
  const factory RefreshState.initial() = _Initial;
  const factory RefreshState.loading() = _Loaded;
  const factory RefreshState.locationAdded() = _LocationAdded;
  const factory RefreshState.ustadzAdded() = _UstadzAdded;
  const factory RefreshState.profileUpdated() = _ProfileUpdated;
  const factory RefreshState.santriAdded() = _SantriAdded;
}
