import 'package:dartz/dartz.dart';
import 'package:sibaba/applications/admin/exception/admin_exception.dart';
import 'package:sibaba/applications/admin/models/ustadz.dart';
import 'package:sibaba/applications/admin/models/ustadz_detail.dart';

abstract class UstadzRepo {
  Future<Either<AdminException, List<Ustadz>>> getUstadz();
  Future<Either<AdminException, DetailUstadz>> getUstadzDetail(int ustadzId);
}
