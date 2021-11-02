part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object?> get props => [];
}

class UserFetched extends UserState {
  final List<UserModel> userModel;

  const UserFetched(this.userModel);
  @override
  List<Object?> get props => [userModel];
}

class UserError extends UserState {
  final String message;

  const UserError(this.message);
  @override
  List<Object?> get props => [message];
}
