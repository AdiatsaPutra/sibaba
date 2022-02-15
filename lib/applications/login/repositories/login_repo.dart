import 'package:dartz/dartz.dart';
import 'package:sibaba/applications/admin/models/user.dart';
import 'package:sibaba/applications/login/exceptions/login_exceptions.dart';

abstract class LoginRepo {
  Future<Either<LoginException, User>> login(String email, String password);
  Future<Either<LoginException, User>> register(
      String name, String email, String password);
}
