import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:sibaba/applications/info_lokasi/model/location.dart';
import 'package:sibaba/applications/info_lokasi/exception/location_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:sibaba/applications/info_lokasi/model/location_detail.dart';
import 'package:sibaba/applications/info_lokasi/model/request/location_request.dart';
import 'package:sibaba/applications/info_lokasi/repository/location_repo.dart';
import 'package:sibaba/infrastructures/api.dart';

import '../../../injection.dart';

@Injectable(as: LocationRepo)
class LocationRepoImpl extends LocationRepo {
  String baseUrl = getIt.get(instanceName: 'baseUrl');
  final dio = Api.createDio();
  @override
  Future<Either<LocationException, Location>> getLocations() async {
    try {
      final response = await dio.get(
        baseUrl + "lokasi",
      );
      if (response.statusCode != 200) {
        throw LocationException(response.data);
      }
      Logger().i(response);
      final data = response.data;
      final locations = Location.fromJson(data);
      return right(locations);
    } catch (e) {
      return left(LocationException(e.toString()));
    }
  }

  @override
  Future<Either<LocationException, LocationDetail>> getLocationDetail(
      String slug) async {
    try {
      final response = await dio.get(
        baseUrl + "lokasi/" + slug,
      );
      if (response.statusCode != 200) {
        throw LocationException(response.data);
      }
      Logger().e(response.data);
      final data = response.data['data'];
      final locationDetail = LocationDetail.fromMap(data);
      return right(locationDetail);
    } catch (e) {
      return left(LocationException(e.toString()));
    }
  }

  @override
  Future<Either<LocationException, void>> addLocation(
      LocationRequest request) async {
    try {
      final response =
          await dio.post(baseUrl + "lokasi/", data: request.toJson());
      if (response.statusCode != 201) {
        throw LocationException(response.data);
      }
      return right(null);
    } catch (e) {
      return left(LocationException(e.toString()));
    }
  }

  @override
  Future<Either<LocationException, void>> deleteLocation(int id) async {
    try {
      final response = await dio.delete(baseUrl + "lokasi/$id");
      if (response.statusCode != 201) {
        throw LocationException(response.data);
      }
      return right(null);
    } catch (e) {
      return left(LocationException(e.toString()));
    }
  }
}
