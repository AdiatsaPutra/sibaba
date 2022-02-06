import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sibaba/applications/admin/models/user.dart';
import 'package:sibaba/applications/admin/repositories/admin_user_repo.dart';

part 'user_state.dart';
part 'user_cubit.freezed.dart';

@injectable
class UserCubit extends Cubit<UserState> {
  UserCubit(this._adminUserRepo) : super(const UserState.initial());

  final AdminUserRepo _adminUserRepo;

  final key = GlobalKey<FormState>();

  List<User> userList = [];
  final searchKeyword = TextEditingController();

  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  String role = '';

  void getUsers() async {
    emit(const UserState.loading());
    final users = await _adminUserRepo.getUsers();
    users.fold(
      (l) => emit(UserState.error(l.message)),
      (r) {
        userList = r;
        emit(UserState.loaded(userList));
      },
    );
  }

  void addUser() async {
    emit(const UserState.loading());
    final users = await _adminUserRepo.addUser(
        name.text, email.text, password.text, role);
    users.fold(
      (l) => emit(UserState.error(l.message)),
      (r) => emit(const UserState.added()),
    );
  }

  void searchUser() {
    emit(const UserState.loading());
    if (searchKeyword.text.isEmpty) {
      emit(UserState.loaded(userList));
    } else {
      final filteredUser = userList
          .where((element) =>
              element.name
                  .toLowerCase()
                  .contains(searchKeyword.text.toLowerCase()) ||
              element.email
                  .toLowerCase()
                  .contains(searchKeyword.text.toLowerCase()))
          .toList();
      emit(UserState.loaded(filteredUser));
    }
  }

  void deleteUser(int id) async {
    emit(const UserState.loading());
    final users = await _adminUserRepo.deleteUser(id);
    users.fold(
      (l) => emit(UserState.error(l.message)),
      (r) => emit(const UserState.deleted()),
    );
  }

  void clear() {
    name.clear();
    email.clear();
    password.clear();
    confirmPassword.clear();
    role = '';
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    UserState.error(error.toString());
    super.onError(error, stackTrace);
  }
}
