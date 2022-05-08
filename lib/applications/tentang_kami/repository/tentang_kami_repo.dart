import 'package:dartz/dartz.dart';
import 'package:sibaba/applications/tentang_kami/exception/tentang_kami_exception.dart';
import 'package:sibaba/applications/tentang_kami/models/tentang.dart';

abstract class TentangKamirepo {
  Future<Either<TentangKamiException, Tentang>> getTentangKami();
  Future<Either<TentangKamiException, void>> updateTentangkami(
    String sejarah,
    String struktur,
    String visimisi,
  );
}
