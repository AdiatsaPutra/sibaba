import 'package:injectable/injectable.dart';
import 'package:sibaba/applications/info_lokasi/exception/location_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:sibaba/applications/tentang_kami/models/tentang.dart';
import 'package:sibaba/applications/tentang_kami/exception/tentang_kami_exception.dart';
import 'package:sibaba/applications/tentang_kami/repository/tentang_kami_repo.dart';
import 'package:sibaba/infrastructures/api.dart';

import '../../../injection.dart';

@Injectable(as: TentangKamirepo)
class TentangKamiRepoImpl extends TentangKamirepo {
  String baseUrl = getIt.get(instanceName: 'baseUrl');
  final dio = Api.createDio();
  @override
  Future<Either<TentangKamiException, Tentang>> getTentangKami() async {
    try {
      final response = await dio.get(
        baseUrl + "tentang",
      );
      if (response.statusCode != 200) {
        throw LocationException(response.data);
      }
      final data = response.data;
      final tentang = Tentang.fromJson(data);
      return right(tentang);
    } catch (e) {
      return left(TentangKamiException(e.toString()));
    }
  }

  @override
  Future<Either<TentangKamiException, void>> updateTentangkami(
      String sejarah, String struktur, String visimisi) async {
    try {
      final response = await dio.put(
        baseUrl + "profile",
        data: {
          "Struktur": struktur,
          "Sejarah": sejarah,
          "Visimisi": visimisi,
        },
      );
      if (response.statusCode != 200) {
        throw LocationException(response.data);
      }
      return right(null);
    } catch (e) {
      return left(TentangKamiException(e.toString()));
    }
  }
}
