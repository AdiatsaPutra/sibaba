// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserStateTearOff {
  const _$UserStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Loading loading() {
    return const _Loading();
  }

  _Picked picked() {
    return const _Picked();
  }

  _Loaded loaded(List<User> users) {
    return _Loaded(
      users,
    );
  }

  _Profile profile(User user) {
    return _Profile(
      user,
    );
  }

  _Added added() {
    return const _Added();
  }

  _Edited edited() {
    return const _Edited();
  }

  _Deleted deleted() {
    return const _Deleted();
  }

  _Error error(String message) {
    return _Error(
      message,
    );
  }
}

/// @nodoc
const $UserState = _$UserStateTearOff();

/// @nodoc
mixin _$UserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() picked,
    required TResult Function(List<User> users) loaded,
    required TResult Function(User user) profile,
    required TResult Function() added,
    required TResult Function() edited,
    required TResult Function() deleted,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? picked,
    TResult Function(List<User> users)? loaded,
    TResult Function(User user)? profile,
    TResult Function()? added,
    TResult Function()? edited,
    TResult Function()? deleted,
    TResult Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? picked,
    TResult Function(List<User> users)? loaded,
    TResult Function(User user)? profile,
    TResult Function()? added,
    TResult Function()? edited,
    TResult Function()? deleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Picked value) picked,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Profile value) profile,
    required TResult Function(_Added value) added,
    required TResult Function(_Edited value) edited,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Picked value)? picked,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Profile value)? profile,
    TResult Function(_Added value)? added,
    TResult Function(_Edited value)? edited,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Picked value)? picked,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Profile value)? profile,
    TResult Function(_Added value)? added,
    TResult Function(_Edited value)? edited,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res> implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  final UserState _value;
  // ignore: unused_field
  final $Res Function(UserState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'UserState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() picked,
    required TResult Function(List<User> users) loaded,
    required TResult Function(User user) profile,
    required TResult Function() added,
    required TResult Function() edited,
    required TResult Function() deleted,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? picked,
    TResult Function(List<User> users)? loaded,
    TResult Function(User user)? profile,
    TResult Function()? added,
    TResult Function()? edited,
    TResult Function()? deleted,
    TResult Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? picked,
    TResult Function(List<User> users)? loaded,
    TResult Function(User user)? profile,
    TResult Function()? added,
    TResult Function()? edited,
    TResult Function()? deleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Picked value) picked,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Profile value) profile,
    required TResult Function(_Added value) added,
    required TResult Function(_Edited value) edited,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Picked value)? picked,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Profile value)? profile,
    TResult Function(_Added value)? added,
    TResult Function(_Edited value)? edited,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Picked value)? picked,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Profile value)? profile,
    TResult Function(_Added value)? added,
    TResult Function(_Edited value)? edited,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements UserState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'UserState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() picked,
    required TResult Function(List<User> users) loaded,
    required TResult Function(User user) profile,
    required TResult Function() added,
    required TResult Function() edited,
    required TResult Function() deleted,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? picked,
    TResult Function(List<User> users)? loaded,
    TResult Function(User user)? profile,
    TResult Function()? added,
    TResult Function()? edited,
    TResult Function()? deleted,
    TResult Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? picked,
    TResult Function(List<User> users)? loaded,
    TResult Function(User user)? profile,
    TResult Function()? added,
    TResult Function()? edited,
    TResult Function()? deleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Picked value) picked,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Profile value) profile,
    required TResult Function(_Added value) added,
    required TResult Function(_Edited value) edited,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Picked value)? picked,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Profile value)? profile,
    TResult Function(_Added value)? added,
    TResult Function(_Edited value)? edited,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Picked value)? picked,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Profile value)? profile,
    TResult Function(_Added value)? added,
    TResult Function(_Edited value)? edited,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements UserState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$PickedCopyWith<$Res> {
  factory _$PickedCopyWith(_Picked value, $Res Function(_Picked) then) =
      __$PickedCopyWithImpl<$Res>;
}

/// @nodoc
class __$PickedCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$PickedCopyWith<$Res> {
  __$PickedCopyWithImpl(_Picked _value, $Res Function(_Picked) _then)
      : super(_value, (v) => _then(v as _Picked));

  @override
  _Picked get _value => super._value as _Picked;
}

/// @nodoc

class _$_Picked implements _Picked {
  const _$_Picked();

  @override
  String toString() {
    return 'UserState.picked()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Picked);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() picked,
    required TResult Function(List<User> users) loaded,
    required TResult Function(User user) profile,
    required TResult Function() added,
    required TResult Function() edited,
    required TResult Function() deleted,
    required TResult Function(String message) error,
  }) {
    return picked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? picked,
    TResult Function(List<User> users)? loaded,
    TResult Function(User user)? profile,
    TResult Function()? added,
    TResult Function()? edited,
    TResult Function()? deleted,
    TResult Function(String message)? error,
  }) {
    return picked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? picked,
    TResult Function(List<User> users)? loaded,
    TResult Function(User user)? profile,
    TResult Function()? added,
    TResult Function()? edited,
    TResult Function()? deleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (picked != null) {
      return picked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Picked value) picked,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Profile value) profile,
    required TResult Function(_Added value) added,
    required TResult Function(_Edited value) edited,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    return picked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Picked value)? picked,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Profile value)? profile,
    TResult Function(_Added value)? added,
    TResult Function(_Edited value)? edited,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
  }) {
    return picked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Picked value)? picked,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Profile value)? profile,
    TResult Function(_Added value)? added,
    TResult Function(_Edited value)? edited,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (picked != null) {
      return picked(this);
    }
    return orElse();
  }
}

abstract class _Picked implements UserState {
  const factory _Picked() = _$_Picked;
}

/// @nodoc
abstract class _$LoadedCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) then) =
      __$LoadedCopyWithImpl<$Res>;
  $Res call({List<User> users});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(_Loaded _value, $Res Function(_Loaded) _then)
      : super(_value, (v) => _then(v as _Loaded));

  @override
  _Loaded get _value => super._value as _Loaded;

  @override
  $Res call({
    Object? users = freezed,
  }) {
    return _then(_Loaded(
      users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ));
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded(this.users);

  @override
  final List<User> users;

  @override
  String toString() {
    return 'UserState.loaded(users: $users)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loaded &&
            const DeepCollectionEquality().equals(other.users, users));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(users));

  @JsonKey(ignore: true)
  @override
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() picked,
    required TResult Function(List<User> users) loaded,
    required TResult Function(User user) profile,
    required TResult Function() added,
    required TResult Function() edited,
    required TResult Function() deleted,
    required TResult Function(String message) error,
  }) {
    return loaded(users);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? picked,
    TResult Function(List<User> users)? loaded,
    TResult Function(User user)? profile,
    TResult Function()? added,
    TResult Function()? edited,
    TResult Function()? deleted,
    TResult Function(String message)? error,
  }) {
    return loaded?.call(users);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? picked,
    TResult Function(List<User> users)? loaded,
    TResult Function(User user)? profile,
    TResult Function()? added,
    TResult Function()? edited,
    TResult Function()? deleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(users);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Picked value) picked,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Profile value) profile,
    required TResult Function(_Added value) added,
    required TResult Function(_Edited value) edited,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Picked value)? picked,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Profile value)? profile,
    TResult Function(_Added value)? added,
    TResult Function(_Edited value)? edited,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Picked value)? picked,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Profile value)? profile,
    TResult Function(_Added value)? added,
    TResult Function(_Edited value)? edited,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements UserState {
  const factory _Loaded(List<User> users) = _$_Loaded;

  List<User> get users;
  @JsonKey(ignore: true)
  _$LoadedCopyWith<_Loaded> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ProfileCopyWith<$Res> {
  factory _$ProfileCopyWith(_Profile value, $Res Function(_Profile) then) =
      __$ProfileCopyWithImpl<$Res>;
  $Res call({User user});
}

/// @nodoc
class __$ProfileCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$ProfileCopyWith<$Res> {
  __$ProfileCopyWithImpl(_Profile _value, $Res Function(_Profile) _then)
      : super(_value, (v) => _then(v as _Profile));

  @override
  _Profile get _value => super._value as _Profile;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_Profile(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$_Profile implements _Profile {
  const _$_Profile(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'UserState.profile(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Profile &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$ProfileCopyWith<_Profile> get copyWith =>
      __$ProfileCopyWithImpl<_Profile>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() picked,
    required TResult Function(List<User> users) loaded,
    required TResult Function(User user) profile,
    required TResult Function() added,
    required TResult Function() edited,
    required TResult Function() deleted,
    required TResult Function(String message) error,
  }) {
    return profile(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? picked,
    TResult Function(List<User> users)? loaded,
    TResult Function(User user)? profile,
    TResult Function()? added,
    TResult Function()? edited,
    TResult Function()? deleted,
    TResult Function(String message)? error,
  }) {
    return profile?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? picked,
    TResult Function(List<User> users)? loaded,
    TResult Function(User user)? profile,
    TResult Function()? added,
    TResult Function()? edited,
    TResult Function()? deleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (profile != null) {
      return profile(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Picked value) picked,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Profile value) profile,
    required TResult Function(_Added value) added,
    required TResult Function(_Edited value) edited,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    return profile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Picked value)? picked,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Profile value)? profile,
    TResult Function(_Added value)? added,
    TResult Function(_Edited value)? edited,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
  }) {
    return profile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Picked value)? picked,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Profile value)? profile,
    TResult Function(_Added value)? added,
    TResult Function(_Edited value)? edited,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (profile != null) {
      return profile(this);
    }
    return orElse();
  }
}

abstract class _Profile implements UserState {
  const factory _Profile(User user) = _$_Profile;

  User get user;
  @JsonKey(ignore: true)
  _$ProfileCopyWith<_Profile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$AddedCopyWith<$Res> {
  factory _$AddedCopyWith(_Added value, $Res Function(_Added) then) =
      __$AddedCopyWithImpl<$Res>;
}

/// @nodoc
class __$AddedCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$AddedCopyWith<$Res> {
  __$AddedCopyWithImpl(_Added _value, $Res Function(_Added) _then)
      : super(_value, (v) => _then(v as _Added));

  @override
  _Added get _value => super._value as _Added;
}

/// @nodoc

class _$_Added implements _Added {
  const _$_Added();

  @override
  String toString() {
    return 'UserState.added()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Added);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() picked,
    required TResult Function(List<User> users) loaded,
    required TResult Function(User user) profile,
    required TResult Function() added,
    required TResult Function() edited,
    required TResult Function() deleted,
    required TResult Function(String message) error,
  }) {
    return added();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? picked,
    TResult Function(List<User> users)? loaded,
    TResult Function(User user)? profile,
    TResult Function()? added,
    TResult Function()? edited,
    TResult Function()? deleted,
    TResult Function(String message)? error,
  }) {
    return added?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? picked,
    TResult Function(List<User> users)? loaded,
    TResult Function(User user)? profile,
    TResult Function()? added,
    TResult Function()? edited,
    TResult Function()? deleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (added != null) {
      return added();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Picked value) picked,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Profile value) profile,
    required TResult Function(_Added value) added,
    required TResult Function(_Edited value) edited,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    return added(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Picked value)? picked,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Profile value)? profile,
    TResult Function(_Added value)? added,
    TResult Function(_Edited value)? edited,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
  }) {
    return added?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Picked value)? picked,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Profile value)? profile,
    TResult Function(_Added value)? added,
    TResult Function(_Edited value)? edited,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (added != null) {
      return added(this);
    }
    return orElse();
  }
}

abstract class _Added implements UserState {
  const factory _Added() = _$_Added;
}

/// @nodoc
abstract class _$EditedCopyWith<$Res> {
  factory _$EditedCopyWith(_Edited value, $Res Function(_Edited) then) =
      __$EditedCopyWithImpl<$Res>;
}

/// @nodoc
class __$EditedCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$EditedCopyWith<$Res> {
  __$EditedCopyWithImpl(_Edited _value, $Res Function(_Edited) _then)
      : super(_value, (v) => _then(v as _Edited));

  @override
  _Edited get _value => super._value as _Edited;
}

/// @nodoc

class _$_Edited implements _Edited {
  const _$_Edited();

  @override
  String toString() {
    return 'UserState.edited()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Edited);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() picked,
    required TResult Function(List<User> users) loaded,
    required TResult Function(User user) profile,
    required TResult Function() added,
    required TResult Function() edited,
    required TResult Function() deleted,
    required TResult Function(String message) error,
  }) {
    return edited();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? picked,
    TResult Function(List<User> users)? loaded,
    TResult Function(User user)? profile,
    TResult Function()? added,
    TResult Function()? edited,
    TResult Function()? deleted,
    TResult Function(String message)? error,
  }) {
    return edited?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? picked,
    TResult Function(List<User> users)? loaded,
    TResult Function(User user)? profile,
    TResult Function()? added,
    TResult Function()? edited,
    TResult Function()? deleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (edited != null) {
      return edited();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Picked value) picked,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Profile value) profile,
    required TResult Function(_Added value) added,
    required TResult Function(_Edited value) edited,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    return edited(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Picked value)? picked,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Profile value)? profile,
    TResult Function(_Added value)? added,
    TResult Function(_Edited value)? edited,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
  }) {
    return edited?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Picked value)? picked,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Profile value)? profile,
    TResult Function(_Added value)? added,
    TResult Function(_Edited value)? edited,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (edited != null) {
      return edited(this);
    }
    return orElse();
  }
}

abstract class _Edited implements UserState {
  const factory _Edited() = _$_Edited;
}

/// @nodoc
abstract class _$DeletedCopyWith<$Res> {
  factory _$DeletedCopyWith(_Deleted value, $Res Function(_Deleted) then) =
      __$DeletedCopyWithImpl<$Res>;
}

/// @nodoc
class __$DeletedCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$DeletedCopyWith<$Res> {
  __$DeletedCopyWithImpl(_Deleted _value, $Res Function(_Deleted) _then)
      : super(_value, (v) => _then(v as _Deleted));

  @override
  _Deleted get _value => super._value as _Deleted;
}

/// @nodoc

class _$_Deleted implements _Deleted {
  const _$_Deleted();

  @override
  String toString() {
    return 'UserState.deleted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Deleted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() picked,
    required TResult Function(List<User> users) loaded,
    required TResult Function(User user) profile,
    required TResult Function() added,
    required TResult Function() edited,
    required TResult Function() deleted,
    required TResult Function(String message) error,
  }) {
    return deleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? picked,
    TResult Function(List<User> users)? loaded,
    TResult Function(User user)? profile,
    TResult Function()? added,
    TResult Function()? edited,
    TResult Function()? deleted,
    TResult Function(String message)? error,
  }) {
    return deleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? picked,
    TResult Function(List<User> users)? loaded,
    TResult Function(User user)? profile,
    TResult Function()? added,
    TResult Function()? edited,
    TResult Function()? deleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Picked value) picked,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Profile value) profile,
    required TResult Function(_Added value) added,
    required TResult Function(_Edited value) edited,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    return deleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Picked value)? picked,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Profile value)? profile,
    TResult Function(_Added value)? added,
    TResult Function(_Edited value)? edited,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
  }) {
    return deleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Picked value)? picked,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Profile value)? profile,
    TResult Function(_Added value)? added,
    TResult Function(_Edited value)? edited,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted(this);
    }
    return orElse();
  }
}

abstract class _Deleted implements UserState {
  const factory _Deleted() = _$_Deleted;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_Error(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'UserState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() picked,
    required TResult Function(List<User> users) loaded,
    required TResult Function(User user) profile,
    required TResult Function() added,
    required TResult Function() edited,
    required TResult Function() deleted,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? picked,
    TResult Function(List<User> users)? loaded,
    TResult Function(User user)? profile,
    TResult Function()? added,
    TResult Function()? edited,
    TResult Function()? deleted,
    TResult Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? picked,
    TResult Function(List<User> users)? loaded,
    TResult Function(User user)? profile,
    TResult Function()? added,
    TResult Function()? edited,
    TResult Function()? deleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Picked value) picked,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Profile value) profile,
    required TResult Function(_Added value) added,
    required TResult Function(_Edited value) edited,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Picked value)? picked,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Profile value)? profile,
    TResult Function(_Added value)? added,
    TResult Function(_Edited value)? edited,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Picked value)? picked,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Profile value)? profile,
    TResult Function(_Added value)? added,
    TResult Function(_Edited value)? edited,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements UserState {
  const factory _Error(String message) = _$_Error;

  String get message;
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith => throw _privateConstructorUsedError;
}
