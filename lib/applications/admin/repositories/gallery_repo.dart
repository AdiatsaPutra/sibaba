import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:sibaba/applications/admin/exception/admin_exception.dart';

abstract class GalleryRepo {
  Future<Either<AdminException, void>> uploadGallery(File file, int userId);
  Future<Either<AdminException, void>> deleteGallery(int galleryId);
}
