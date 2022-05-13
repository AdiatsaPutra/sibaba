part of 'gallery_cubit.dart';

@freezed
class GalleryState with _$GalleryState {
  const factory GalleryState.initial() = _Initial;
  const factory GalleryState.loading() = _Loading;
  const factory GalleryState.success() = _Success;
  const factory GalleryState.successDelete() = _SuccessDelete;
  const factory GalleryState.error(String message) = _Error;
}
