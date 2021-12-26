import 'package:dartz/dartz.dart';
import 'package:sibaba/applications/info_lokasi/exception/location_exception.dart';
import 'package:sibaba/applications/info_lokasi/model/location.dart';

abstract class LocationRepo {
  Future<Either<LocationException, List<Location>>> getLocations();
}
