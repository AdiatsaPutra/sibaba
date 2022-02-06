import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:sibaba/applications/admin/models/user.dart';
import 'package:sibaba/applications/admin/exception/admin_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:sibaba/applications/admin/repositories/admin_user_repo.dart';
import 'package:sibaba/infrastructures/api.dart';

import '../../../injection.dart';

@Injectable(as: AdminUserRepo)
class AdminUserImpl extends AdminUserRepo {
  String baseUrl = getIt.get(instanceName: 'baseUrl');
  final dio = Api.createDio();
  @override
  Future<Either<AdminException, List<User>>> getUsers() async {
    try {
      final response = await dio.get(
        baseUrl + "users",
      );
      if (response.statusCode != 200) {
        throw AdminException(response.data);
      }
      List data = response.data['data'];
      final users = data.map((e) => User.fromMap(e)).toList();
      Logger().i(users);
      return right(users);
    } catch (e) {
      return left(AdminException(e.toString()));
    }
  }

  @override
  Future<Either<AdminException, void>> addUser(
      String name, String email, String password, String role) async {
    try {
      final data = {
        'name': name,
        'email': email,
        'password': password,
        'roles': role
      };
      final response = await dio.post(baseUrl + "users", data: data);
      if (response.statusCode != 200) {
        throw AdminException(response.data);
      }
      return right(null);
    } catch (e) {
      return left(AdminException(e.toString()));
    }
  }

  @override
  Future<Either<AdminException, void>> deleteUser(int id) async {
    try {
      final response = await dio.delete(
        baseUrl + "users" + "/$id",
      );
      if (response.statusCode != 200) {
        throw AdminException(response.data);
      }
      return right(null);
    } catch (e) {
      return left(AdminException(e.toString()));
    }
  }
}
