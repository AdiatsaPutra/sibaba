import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:sibaba/applications/info_lokasi/model/location.dart';
import 'package:sibaba/applications/info_lokasi/exception/location_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:sibaba/applications/info_lokasi/model/location_detail.dart';
import 'package:sibaba/applications/info_lokasi/repository/location_repo.dart';
import 'package:sibaba/infrastructures/api.dart';

import '../../../injection.dart';

@Injectable(as: LocationRepo)
class LocationRepoImpl extends LocationRepo {
  String baseUrl = getIt.get(instanceName: 'baseUrl');
  final dio = Api.createDio();
  @override
  Future<Either<LocationException, List<Location>>> getLocations() async {
    try {
      final response = await dio.get(
        baseUrl + "lokasi",
      );
      if (response.statusCode != 200) {
        throw LocationException(response.data);
      }
      Logger().i(response);
      List data = response.data['lokasi'];
      final locations = data.map((e) => Location.fromMap(e)).toList();
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
      Logger().i(response);
      final data = response.data['data'];
      final locationDetail = LocationDetail.fromMap(data);
      return right(locationDetail);
    } catch (e) {
      return left(LocationException(e.toString()));
    }
  }
}
