import 'dart:io';

import 'package:dio/dio.dart';
import 'package:open_file/open_file.dart' as open;
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sibaba/applications/admin/models/santri.dart';
import 'package:sibaba/applications/admin/exception/admin_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:sibaba/applications/admin/repositories/santri_repo.dart';
import 'package:http/http.dart' as http;
import 'package:sibaba/infrastructures/api.dart';

import '../../../injection.dart';

@Injectable(as: SantriRepo)
class SantriImpl extends SantriRepo {
  String baseUrl = getIt.get(instanceName: 'baseUrl');
  final dio = Api.createDio();

  @override
  Future<Either<AdminException, List<Santri>>> getSantri() async {
    try {
      final response = await dio.get(
        baseUrl + "santri",
      );
      if (response.statusCode != 200) {
        throw AdminException(response.data);
      }
      List data = response.data['data']['santri'];
      final santri = data.map((e) => Santri.fromJson(e)).toList();
      return right(santri);
    } catch (e) {
      return left(AdminException(e.toString()));
    }
  }

  @override
  Future<Either<AdminException, void>> deleteSantri(int id) async {
    try {
      final response = await dio.delete(
        baseUrl + "santri/$id",
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
  Future<Either<AdminException, void>> addSantri(
    int userId,
    String wilayah,
    String unit,
    String tahunAjaran,
    File fileSantri,
  ) async {
    try {
      String fileName = fileSantri.path.split('/').last;
      FormData formData = FormData.fromMap({
        "userId": userId,
        "Wilayah": wilayah,
        "Unit": unit,
        "Tahun_ajaran": tahunAjaran,
        "File":
            await MultipartFile.fromFile(fileSantri.path, filename: fileName),
      });
      await Api.createDio().post(
        baseUrl + 'santri',
        data: formData,
      );
      return right(null);
    } catch (e) {
      return left(AdminException(e.toString()));
    }
  }

  @override
  Future<Either<AdminException, void>> editSantri(int santriId, String wilayah,
      String unit, String tahunAjaran, File? fileSantri) async {
    try {
      if (fileSantri != null) {
        String fileName = fileSantri.path.split('/').last;
        FormData formData = FormData.fromMap({
          "Wilayah": wilayah,
          "Unit": unit,
          "Tahun_ajaran": tahunAjaran,
          "File":
              await MultipartFile.fromFile(fileSantri.path, filename: fileName),
        });
        await Api.createDio().put(
          baseUrl + 'santri/$santriId',
          data: formData,
        );
      } else {
        FormData formData = FormData.fromMap({
          "Wilayah": wilayah,
          "Unit": unit,
          "Tahun_ajaran": tahunAjaran,
        });
        await Api.createDio().put(
          baseUrl + 'santri/$santriId',
          data: formData,
        );
      }
      return right(null);
    } catch (e) {
      return left(AdminException(e.toString()));
    }
  }

  @override
  Future<Either<AdminException, void>> downloadSantri(int id) async {
    try {
      var dir = '';
      Directory? appDir;

      if (Platform.isIOS) {
        appDir = await getTemporaryDirectory();
      } else {
        appDir = await getExternalStorageDirectory();
      }

      dir = appDir!.path;

      final response =
          await http.get(Uri.parse(baseUrl + "santri/download/$id"));

      final fn = response.headers['filename'];
      final file = File('$dir/$fn.xlsx');
      final _data = response.bodyBytes;
      var raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(_data);
      await raf.close();
      await open.OpenFile.open(file.path);
      if (response.statusCode != 200) {
        throw AdminException(response.body);
      }
      return right(null);
    } catch (e) {
      return left(AdminException(e.toString()));
    }
  }
}
