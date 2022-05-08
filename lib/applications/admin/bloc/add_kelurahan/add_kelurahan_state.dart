part of 'add_kelurahan_cubit.dart';

@freezed
class AddKelurahanState with _$AddKelurahanState {
  const factory AddKelurahanState.initial() = _Initial;
  const factory AddKelurahanState.loading() = _Loading;
  const factory AddKelurahanState.loaded() = _Loaded;
  const factory AddKelurahanState.added() = _Added;
  const factory AddKelurahanState.error(String message) = _Error;
}
