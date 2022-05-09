import 'package:dartz/dartz.dart';
import 'package:sibaba/applications/admin/exception/admin_exception.dart';
import 'package:sibaba/applications/admin/models/kelurahan.dart';

abstract class KelurahanRepo {
  Future<Either<AdminException, List<Kelurahan>>> getKelurahan();
  Future<Either<AdminException, void>> addKelurahan(
    int id,
    String name,
  );
  Future<Either<AdminException, void>> updateKelurahan(
      int kapanewonId, String name, int id);
  Future<Either<AdminException, void>> deleteKelurahan(int id);
}
