import 'package:injectable/injectable.dart';
import 'package:sibaba/applications/admin/models/kapanewon.dart';
import 'package:sibaba/applications/admin/exception/admin_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:sibaba/applications/admin/repositories/kapanewon_repo.dart';
import 'package:sibaba/infrastructures/api.dart';

import '../../../injection.dart';

@Injectable(as: KapanewonRepo)
class KapanewonRepoImpl extends KapanewonRepo {
  String baseUrl = getIt.get(instanceName: 'baseUrl');
  final dio = Api.createDio();
  @override
  Future<Either<AdminException, List<Kapanewon>>> getKapanewon() async {
    try {
      final response = await dio.get(
        baseUrl + "kapanewon",
      );
      if (response.statusCode != 200) {
        throw AdminException(response.data);
      }
      List data = response.data['data'];
      final kapanewon = data.map((e) => Kapanewon.fromMap(e)).toList();
      return right(kapanewon);
    } catch (e) {
      return left(AdminException(e.toString()));
    }
  }

  @override
  Future<Either<AdminException, void>> addKapanewon(
      String name, String kode) async {
    try {
      final data = {
        'area_name': name,
        'kode_area': kode,
      };
      final response = await dio.post(baseUrl + "kapanewon", data: data);
      if (response.statusCode != 200) {
        throw AdminException(response.data);
      }
      return right(null);
    } catch (e) {
      return left(AdminException(e.toString()));
    }
  }

  @override
  Future<Either<AdminException, void>> updateKapanewon(
      String name, String kode, int id) async {
    try {
      final data = {
        'area_name': name,
        'kode_area': kode,
      };
      final response = await dio.put(
        baseUrl + "kapanewon" + '/$id',
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
  Future<Either<AdminException, void>> deleteKapanewon(int id) async {
    try {
      final response = await dio.delete(
        baseUrl + "kapanewon" + "/$id",
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
