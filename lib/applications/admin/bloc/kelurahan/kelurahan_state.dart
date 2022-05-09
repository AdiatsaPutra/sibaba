part of 'kelurahan_cubit.dart';

@freezed
class KelurahanState with _$KelurahanState {
  const factory KelurahanState.initial() = _Initial;
  const factory KelurahanState.loading() = _Loading;
  const factory KelurahanState.picked() = _Picked;
  const factory KelurahanState.loaded(List<Kelurahan> kapanewon) = _Loaded;
  const factory KelurahanState.updated() = _Updated;
  const factory KelurahanState.deleted() = _Deleted;
  const factory KelurahanState.error(String message) = _Error;
}
