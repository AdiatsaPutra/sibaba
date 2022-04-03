part of 'ustadz_cubit.dart';

@freezed
class UstadzState with _$UstadzState {
  const factory UstadzState.initial() = _Initial;
  const factory UstadzState.loading() = _Loading;
  const factory UstadzState.loaded(List<Ustadz> ustadz) = _Loaded;
  const factory UstadzState.detailLoaded(DetailUstadz ustadz) = _DetailLoaded;
  const factory UstadzState.error(String message) = _Error;
}
