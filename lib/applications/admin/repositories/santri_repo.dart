import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:sibaba/applications/admin/exception/admin_exception.dart';
import 'package:sibaba/applications/admin/models/santri.dart';

abstract class SantriRepo {
  Future<Either<AdminException, List<Santri>>> getSantri();
  Future<Either<AdminException, void>> downloadSantri(int id);
  Future<Either<AdminException, void>> addSantri(
    int userId,
    String wilayah,
    String unit,
    String tahunAjaran,
    File fileSantri,
  );
  Future<Either<AdminException, void>> editSantri(
    int santriId,
    String wilayah,
    String unit,
    String tahunAjaran,
    File? fileSantri,
  );
  Future<Either<AdminException, void>> deleteSantri(int id);
}
