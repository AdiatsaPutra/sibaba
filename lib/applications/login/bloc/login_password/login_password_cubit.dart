import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_password_state.dart';
part 'login_password_cubit.freezed.dart';

class LoginPasswordCubit extends Cubit<LoginPasswordState> {
  LoginPasswordCubit() : super(const LoginPasswordState.initial());

  bool isObscure = true;
  bool isConfirmObscure = true;

  void setObscure() {
    emit(const LoginPasswordState.loading());
    isObscure = !isObscure;
    emit(const LoginPasswordState.loaded());
  }

  void setConfirmObscure() {
    emit(const LoginPasswordState.loading());
    isConfirmObscure = !isConfirmObscure;
    emit(const LoginPasswordState.loaded());
  }
}
