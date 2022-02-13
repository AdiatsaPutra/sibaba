import 'package:dartz/dartz.dart';
import 'package:sibaba/applications/admin/models/user.dart';
import 'package:sibaba/applications/login/exceptions/login_exceptions.dart';
import 'package:sibaba/applications/login/models/user_sibaba.dart';

abstract class LoginRepo {
  Future<Either<LoginException, UserSibaba>> login(
      String email, String password);
}
