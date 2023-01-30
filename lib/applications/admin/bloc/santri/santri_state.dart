part of 'santri_cubit.dart';

@freezed
class SantriState with _$SantriState {
  const factory SantriState.initial() = _Initial;
  const factory SantriState.loading() = _Loading;
  const factory SantriState.loaded() = _Loaded;
  const factory SantriState.success(List<Santri> santri) = _Success;
  const factory SantriState.added() = _Added;
  const factory SantriState.updated() = _Updated;
  const factory SantriState.deleted() = _Deleted;
  const factory SantriState.error(String message) = _Error;
}
