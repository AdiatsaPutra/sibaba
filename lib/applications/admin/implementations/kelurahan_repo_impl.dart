import 'package:injectable/injectable.dart';
import 'package:sibaba/applications/admin/exception/admin_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:sibaba/applications/admin/models/kelurahan.dart';
import 'package:sibaba/applications/admin/repositories/kelurahan_repo.dart';
import 'package:sibaba/infrastructures/api.dart';

import '../../../injection.dart';

@Injectable(as: KelurahanRepo)
class KelurahanRepoImpl extends KelurahanRepo {
  String baseUrl = getIt.get(instanceName: 'baseUrl');
  final dio = Api.createDio();

  @override
  Future<Either<AdminException, void>> addKelurahan(int id, String name) async {
    try {
      final data = {
        'Area_id': id,
        'district_name': name,
      };
      final response = await dio.post(baseUrl + "kelurahan", data: data);
      if (response.statusCode != 200) {
        throw AdminException(response.data);
      }
      return right(null);
    } catch (e) {
      return left(AdminException(e.toString()));
    }
  }

  @override
  Future<Either<AdminException, void>> updateKelurahan(
      int kapanewonId, String name, int id) async {
    try {
      final data = {
        'Area_id': kapanewonId,
        'district_name': name,
      };
      final response = await dio.put(
        baseUrl + "kelurahan" + '/$id',
        data: data,
      );
      if (response.statusCode != 200) {
        throw AdminException(response.data);
      }
      return right(null);
    } catch (e) {
      return left(AdminException(e.toString()));
    }
  }

  @override
  Future<Either<AdminException, void>> deleteKelurahan(int id) async {
    try {
      final response = await dio.delete(
        baseUrl + "kelurahan" + "/$id",
      );
      if (response.statusCode != 200) {
        throw AdminException(response.data);
      }
      return right(null);
    } catch (e) {
      return left(AdminException(e.toString()));
    }
  }

  @override
  Future<Either<AdminException, List<Kelurahan>>> getKelurahan() async {
    try {
      final response = await dio.get(
        baseUrl + "kelurahan",
      );
      if (response.statusCode != 200) {
        throw AdminException(response.data);
      }
      List data = response.data['data'];
      final kelurahan = data.map((e) => Kelurahan.fromJson(e)).toList();
      return right(kelurahan);
    } catch (e) {
      return left(AdminException(e.toString()));
    }
  }
}
