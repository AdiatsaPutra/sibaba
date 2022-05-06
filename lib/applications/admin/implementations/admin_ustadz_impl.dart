import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:sibaba/applications/admin/exception/admin_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:sibaba/applications/admin/models/request/ustadz_request.dart';
import 'package:sibaba/applications/admin/models/ustadz.dart';
import 'package:sibaba/applications/admin/models/ustadz_detail.dart';
import 'package:sibaba/applications/admin/repositories/ustadz_repo.dart';
import 'package:sibaba/infrastructures/api.dart';

import '../../../injection.dart';

@Injectable(as: UstadzRepo)
class AdminUstadzImpl extends UstadzRepo {
  String baseUrl = getIt.get(instanceName: 'baseUrl');
  final dio = Api.createDio();

  @override
  Future<Either<AdminException, List<Ustadz>>> getUstadz() async {
    try {
      final response = await dio.get(
        baseUrl + "teacher/all",
      );
      Logger().i(response);
      if (response.statusCode != 200) {
        throw AdminException(response.data);
      }
      List data = response.data['data'];
      final ustadz = data.map((e) => Ustadz.fromJson(e)).toList();
      return right(ustadz);
    } catch (e) {
      return left(AdminException(e.toString()));
    }
  }

  @override
  Future<Either<AdminException, DetailUstadz>> getUstadzDetail(
      int ustadzId) async {
    try {
      final response = await dio.get(
        baseUrl + "teacher/$ustadzId",
      );
      if (response.statusCode != 200) {
        throw AdminException(response.data);
      }
      final data = response.data['data'];
      final ustadz = DetailUstadz.fromJson(data);
      return right(ustadz);
    } catch (e) {
      return left(AdminException(e.toString()));
    }
  }

  @override
  Future<Either<AdminException, void>> addUstadzs(
      UstadzRequest ustadzRequest) async {
    try {
      final response = await dio.post(
        baseUrl + "teacher",
        data: ustadzRequest.toJson(),
      );
      if (response.statusCode != 200) {
        throw AdminException(response.data);
      }
      return right(null);
    } catch (e) {
      return left(AdminException(e.toString()));
    }
  }
}
