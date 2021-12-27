part of 'kontak_kami_cubit.dart';

@freezed
class KontakKamiState with _$KontakKamiState {
  const factory KontakKamiState.initial() = _Initial;
  const factory KontakKamiState.loading() = _Loading;
  const factory KontakKamiState.loaded(InfoKontak infoKontak) = _Loaded;
  const factory KontakKamiState.messageSend() = _MessageSend;
  const factory KontakKamiState.error(String error) = _Error;
}
