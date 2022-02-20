part of 'login_password_cubit.dart';

@freezed
class LoginPasswordState with _$LoginPasswordState {
  const factory LoginPasswordState.initial() = _Initial;
  const factory LoginPasswordState.loading() = _Loading;
  const factory LoginPasswordState.loaded() = _Loaded;
}
