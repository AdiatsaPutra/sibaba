part of 'info_lokasi_cubit.dart';

@freezed
class InfoLokasiState with _$InfoLokasiState {
  const factory InfoLokasiState.initial() = _Initial;
  const factory InfoLokasiState.loading() = _Loading;
  const factory InfoLokasiState.picked() = _Picked;
  const factory InfoLokasiState.loaded(Location locations) = _Loaded;
  const factory InfoLokasiState.detailLoaded(LocationDetail location) =
      _DetailLoaded;
  const factory InfoLokasiState.added() = _Added;
  const factory InfoLokasiState.deleted() = _Deleted;
  const factory InfoLokasiState.error(String message) = _Error;
}
