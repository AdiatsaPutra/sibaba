part of 'location_cubit.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState.initial() = _Initial;
  const factory LocationState.loading() = _Loading;
  const factory LocationState.success() = _Success;
  const factory LocationState.error(String message) = _Error;
  const factory LocationState.addressFetched() = _AddressFetched;
}
