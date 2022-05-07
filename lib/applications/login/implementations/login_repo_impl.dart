import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sibaba/applications/login/exceptions/login_exceptions.dart';
import 'package:sibaba/applications/admin/models/user.dart';
import 'package:sibaba/applications/login/repositories/login_repo.dart';
import 'package:sibaba/infrastructures/api.dart';

import '../../../injection.dart';

@Injectable(as: LoginRepo)
class LoginRepoImpl extends LoginRepo {
  String baseUrl = getIt.get(instanceName: 'baseUrl');
  final dio = Api.createDio();
  @override
  Future<Either<LoginException, User>> login(
      String email, String password) async {
    try {
      final parameters = {"email": email, "password": password};
      final response = await dio.post(
        baseUrl + "login",
        data: parameters,
        options: Options(
          headers: {'Content-Type': 'application/json'},
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      if (response.statusCode != 200) {
        throw LoginException(response.data['message']);
      }
      final data = response.data['data'];
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('user', data['name']);
      final user = User.fromMap(data);
      return right(user);
    } catch (e) {
      return left(LoginException(e.toString()));
    }
  }

  @override
  Future<Either<LoginException, User>> register(
      String name, String email, String password) async {
    try {
      final parameters = {"name": name, "email": email, "password": password};
      final response = await dio.post(
        baseUrl + "register",
        data: parameters,
        options: Options(
          headers: {'Content-Type': 'application/json'},
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      if (response.statusCode != 200) {
        throw LoginException(response.data['message']);
      }
      final data = response.data['data'];
      final user = User.fromMap(data);
      return right(user);
    } catch (e) {
      return left(LoginException(e.toString()));
    }
  }
}
