import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sibaba/applications/admin/models/user.dart';
import 'package:sibaba/applications/login/models/user_sibaba.dart';
import 'package:sibaba/applications/login/repositories/login_repo.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  final LoginRepo _loginRepo;

  final key = GlobalKey<FormState>();

  final searchKeyword = TextEditingController();

  UserSibaba user = UserSibaba(
    id: 0,
    name: '',
    userSlug: '',
    email: '',
    emailVerifiedAt: '',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  final email = TextEditingController();
  final password = TextEditingController();

  String role = '';

  void login() async {
    emit(const LoginState.loading());
    final login = await _loginRepo.login(email.text, password.text);
    login.fold(
      (l) => emit(LoginState.error(l.message)),
      (r) {
        user = r;
        emit(LoginState.loaded(user));
      },
    );
  }

  void setUser(UserSibaba u) {
    user = u;
  }

  void clear() {
    email.clear();
    password.clear();
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    LoginState.error(error.toString());
    super.onError(error, stackTrace);
  }
}
