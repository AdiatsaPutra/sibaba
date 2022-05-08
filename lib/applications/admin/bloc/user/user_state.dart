part of 'user_cubit.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _Initial;
  const factory UserState.loading() = _Loading;
  const factory UserState.picked() = _Picked;
  const factory UserState.loaded(List<User> users) = _Loaded;
  const factory UserState.profile(User user) = _Profile;
  const factory UserState.added() = _Added;
  const factory UserState.edited() = _Edited;
  const factory UserState.deleted() = _Deleted;
  const factory UserState.error(String message) = _Error;
}
