import 'package:dartz/dartz.dart';
import 'package:sibaba/applications/admin/exception/admin_exception.dart';
import 'package:sibaba/applications/admin/models/user.dart';

abstract class AdminUserRepo {
  Future<Either<AdminException, List<User>>> getUsers();
  Future<Either<AdminException, User>> profile(String email);
  Future<Either<AdminException, void>> addUser(
    String name,
    String email,
    String password,
    String role,
  );
  Future<Either<AdminException, void>> editUser(
    int id,
    String name,
    String email,
    String password,
    String role,
  );
  Future<Either<AdminException, void>> deleteUser(int id);
}
