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

  List<User> userList = [];
  final searchKeyword = TextEditingController();

  void getUsers() async {
    final users = await _adminUserRepo.getUsers();
    users.fold(
      (l) => userList.clear(),
      (r) => userList.addAll(r),
    );
    emit(UserState.loaded(userList));
  }

  // void searchUser() {
  //   emit(const UserState.loading());
  //   if (searchKeyword.text.isEmpty) {
  //     emit(UserState.loaded(locationList));
  //   } else {
  //     final filteredLokasi = locationList
  //         .where(
  //           (element) => element.nama!
  //               .toLowerCase()
  //               .contains(searchKeyword.text.toLowerCase()),
  //         )
  //         .toList();
  //     emit(UserState.loaded(filteredLokasi));
  //   }
  // }

  @override
  void onError(Object error, StackTrace stackTrace) {
    UserState.error(error.toString());
    super.onError(error, stackTrace);
  }
}
