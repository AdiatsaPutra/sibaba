import 'package:dartz/dartz.dart';
import 'package:sibaba/applications/admin/exception/admin_exception.dart';
import 'package:sibaba/applications/admin/models/user.dart';

abstract class AdminUserRepo {
  Future<Either<AdminException, List<User>>> getUsers();
}
