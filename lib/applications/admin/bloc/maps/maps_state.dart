part of 'maps_cubit.dart';

@freezed
class MapsState with _$MapsState {
  const factory MapsState.initial() = _Initial;
  const factory MapsState.loading() = _Loading;
  const factory MapsState.loaded() = _Loaded;
}
