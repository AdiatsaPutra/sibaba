import 'package:dartz/dartz.dart';
import 'package:sibaba/applications/admin/exception/admin_exception.dart';
import 'package:sibaba/applications/admin/models/kapanewon.dart';

abstract class KapanewonRepo {
  Future<Either<AdminException, List<Kapanewon>>> getKapanewon();
  Future<Either<AdminException, void>> addKapanewon(
    String name,
    String kode,
  );
  Future<Either<AdminException, void>> updateKapanewon(
      String name, String kode, int id);
  Future<Either<AdminException, void>> deleteKapanewon(int id);
}
