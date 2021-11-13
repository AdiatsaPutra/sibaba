import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sibaba/models/user_model.dart';
import 'package:sibaba/repositories/api_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final ApiRepository apiRepository;
  UserCubit(this.apiRepository) : super(UserInitial());

  Future<void> register(
      {required String name,
      required String email,
      required String password,
      required String confirmPassword}) async {
    try {
      await apiRepository.register(
          name: name,
          email: email,
          password: password,
          confirmPassword: confirmPassword);
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> getUsers() async {
    try {
      List<UserModel> userModel = await apiRepository.getUsers();
      emit(UserFetched(userModel));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
