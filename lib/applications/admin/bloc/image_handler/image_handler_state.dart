part of 'image_handler_cubit.dart';

@freezed
class ImageHandlerState with _$ImageHandlerState {
  const factory ImageHandlerState.initial() = _Initial;
  const factory ImageHandlerState.loading() = _Loading;
  const factory ImageHandlerState.loaded() = _Loaded;
  const factory ImageHandlerState.error() = _Error;
}
