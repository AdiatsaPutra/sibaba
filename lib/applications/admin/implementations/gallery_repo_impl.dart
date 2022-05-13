import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:sibaba/applications/admin/exception/admin_exception.dart';

import '../../../infrastructures/api.dart';
import '../../../injection.dart';
import '../repositories/gallery_repo.dart';

@Injectable(as: GalleryRepo)
class GalleryRepoImpl extends GalleryRepo {
  String baseUrl = getIt.get(instanceName: 'baseUrl');
  final dio = Api.createDio();
  @override
  Future<Either<AdminException, void>> uploadGallery(
      File file, int userId) async {
    try {
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path, filename: fileName),
        "userId": userId,
      });
      await Api.createDio().post(
        baseUrl + 'gallery',
        data: formData,
      );
      return right(null);
    } catch (e) {
      return left(AdminException(e.toString()));
    }
  }

  @override
  Future<Either<AdminException, void>> deleteGallery(int galleryId) async {
    try {
      final response = await Api.createDio().delete(
        baseUrl + 'gallery/$galleryId',
      );
      return right(null);
    } catch (e) {
      return left(AdminException(e.toString()));
    }
  }
}
