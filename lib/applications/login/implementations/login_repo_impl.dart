import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:sibaba/applications/login/exceptions/login_exceptions.dart';
import 'package:sibaba/applications/admin/models/user.dart';
import 'package:sibaba/applications/login/models/user_sibaba.dart';
import 'package:sibaba/applications/login/repositories/login_repo.dart';
import 'package:sibaba/infrastructures/api.dart';

import '../../../injection.dart';

@Injectable(as: LoginRepo)
class LoginRepoImpl extends LoginRepo {
  String baseUrl = getIt.get(instanceName: 'baseUrl');
  final dio = Api.createDio();
  @override
  Future<Either<LoginException, UserSibaba>> login(
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
      final user = UserSibaba.fromMap(data);
      return right(user);
    } catch (e) {
      return left(LoginException(e.toString()));
    }
  }
}
