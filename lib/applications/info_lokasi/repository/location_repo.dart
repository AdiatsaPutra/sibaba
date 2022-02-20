import 'package:dartz/dartz.dart';
import 'package:sibaba/applications/info_lokasi/exception/location_exception.dart';
import 'package:sibaba/applications/info_lokasi/model/location.dart';
import 'package:sibaba/applications/info_lokasi/model/location_detail.dart';
import 'package:sibaba/applications/info_lokasi/model/request/location_request.dart';

abstract class LocationRepo {
  Future<Either<LocationException, List<Location>>> getLocations();
  Future<Either<LocationException, LocationDetail>> getLocationDetail(
    String slug,
  );
  Future<Either<LocationException, void>> addLocation(LocationRequest request);
}
