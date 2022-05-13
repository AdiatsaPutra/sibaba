import 'dart:io';

import 'package:dio/dio.dart';
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
      File file, UstadzRequest ustadzRequest) async {
    try {
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap({
        "Photo": await MultipartFile.fromFile(file.path, filename: fileName),
        "User_id": ustadzRequest.userId,
        "Location_name": ustadzRequest.locationName,
        "Nama": ustadzRequest.nama,
        "Gender": ustadzRequest.gender,
        "Tmp_lahir": ustadzRequest.tmpLahir,
        "Tgl_lahir": ustadzRequest.tglLahir,
        "Alamat": ustadzRequest.alamat,
        "Telpon": ustadzRequest.telpon,
        "Email": ustadzRequest.email,
        "Mulai_ustadz": ustadzRequest.mulaiUstadz,
        "Status": ustadzRequest.status,
        "T_Ajar": ustadzRequest.tAjar,
        "TK": ustadzRequest.tk,
        "TK_lulus": ustadzRequest.tkLulus,
        "SD": ustadzRequest.sd,
        "SD_lulus": ustadzRequest.sdLulus,
        "SMP": ustadzRequest.smp,
        "SMP_lulus": ustadzRequest.smpLulus,
        "SMA": ustadzRequest.sma,
        "SMA_lulus": ustadzRequest.smaLulus,
        "PT": ustadzRequest.pt,
        "PT_lulus": ustadzRequest.ptLulus,
        "Dasar": ustadzRequest.dasar,
        "Mahir1": ustadzRequest.mahir1,
        "Mahir2": ustadzRequest.mahir2,
        "TOT": ustadzRequest.tot,
        "S1": ustadzRequest.s1,
        "S2A": ustadzRequest.s2A,
        "S2B": ustadzRequest.s2B,
        "S2C": ustadzRequest.s2C,
        "S3": ustadzRequest.s3,
      });
      Logger().i(formData);
      final response = await dio.post(
        baseUrl + "teacher",
        data: formData,
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
  Future<Either<AdminException, void>> deleteUstadz(int id) async {
    try {
      final response = await dio.delete(
        baseUrl + "teacher/$id",
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
