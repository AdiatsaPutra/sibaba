part of 'kapanewon_cubit.dart';

@freezed
class KapanewonState with _$KapanewonState {
  const factory KapanewonState.initial() = _Initial;
  const factory KapanewonState.loading() = _Loading;
  const factory KapanewonState.loaded(List<Kapanewon> kapanewon) = _Loaded;
  const factory KapanewonState.added() = _Added;
  const factory KapanewonState.updated() = _Updated;
  const factory KapanewonState.deleted() = _Deleted;
  const factory KapanewonState.error(String message) = _Error;
}
