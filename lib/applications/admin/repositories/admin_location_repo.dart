import 'package:dartz/dartz.dart';
import 'package:sibaba/applications/admin/exception/admin_exception.dart';
import 'package:sibaba/applications/info_lokasi/model/request/location_request.dart';

abstract class AdminLocationRepo {
  Future<Either<AdminException, void>> addLokasi(
    LocationRequest locationRequest,
  );
  Future<Either<AdminException, void>> deleteLokasi(int id);
}
