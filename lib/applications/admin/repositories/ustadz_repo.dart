import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:sibaba/applications/admin/exception/admin_exception.dart';
import 'package:sibaba/applications/admin/models/request/ustadz_request.dart';
import 'package:sibaba/applications/admin/models/ustadz.dart';
import 'package:sibaba/applications/admin/models/ustadz_detail.dart';

abstract class UstadzRepo {
  Future<Either<AdminException, List<Ustadz>>> getUstadz();
  Future<Either<AdminException, DetailUstadz>> getUstadzDetail(int ustadzId);
  Future<Either<AdminException, void>> addUstadzs(
      File file, UstadzRequest ustadzRequest);
  Future<Either<AdminException, void>> deleteUstadz(int id);
}
