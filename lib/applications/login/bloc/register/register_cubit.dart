import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sibaba/applications/admin/models/user.dart';
import 'package:sibaba/applications/login/repositories/login_repo.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._loginRepo) : super(const RegisterState.initial());

  final LoginRepo _loginRepo;

  final key = GlobalKey<FormState>();

  User user = User(
    id: 0,
    name: '',
    userSlug: '',
    email: '',
    emailVerifiedAt: '',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    roles: [],
  );

  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  void register() async {
    emit(const RegisterState.loading());
    final login =
        await _loginRepo.register(name.text, email.text, password.text);
    login.fold(
      (l) => emit(RegisterState.error(l.message)),
      (r) {
        user = r;
        emit(RegisterState.loaded(user));
      },
    );
  }

  void clear() {
    name.clear();
    email.clear();
    password.clear();
    confirmPassword.clear();
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    RegisterState.error(error.toString());
    super.onError(error, stackTrace);
  }
}
