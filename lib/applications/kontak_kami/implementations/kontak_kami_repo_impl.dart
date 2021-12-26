import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:dartz/dartz.dart';
import 'package:sibaba/applications/kontak_kami/exception/kontak_kami_exception.dart';
import 'package:sibaba/applications/kontak_kami/models/info_kontak.dart';
import 'package:sibaba/applications/kontak_kami/repository/kontak_kami_repo.dart';
import 'package:sibaba/applications/tentang_kami/exception/tentang_kami_exception.dart';

import '../../../injection.dart';

@Injectable(as: KontakKamiRepo)
class KontakKamiRepoImpl extends KontakKamiRepo {
  String baseUrl = getIt.get(instanceName: 'baseUrl');
  final dio = Dio();
  @override
  Future<Either<KontakException, InfoKontak>> getKontakKami() async {
    try {
      final response = await dio.get(
        baseUrl + "kontak",
      );
      if (response.statusCode != 200) {
        throw KontakException(response.data);
      }
      final data = response.data['data'];
      final kontak = InfoKontak.fromJson(data);
      return right(kontak);
    } catch (e) {
      return left(KontakException(e.toString()));
    }
  }
}
