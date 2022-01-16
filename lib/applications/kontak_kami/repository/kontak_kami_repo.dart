import 'package:dartz/dartz.dart';
import 'package:sibaba/applications/kontak_kami/exception/kontak_kami_exception.dart';
import 'package:sibaba/applications/kontak_kami/models/info_kontak.dart';

abstract class KontakKamiRepo {
  Future<Either<KontakException, InfoKontak>> getKontakKami();
  Future<Either<KontakException, void>> sendMessage(
    String fullName,
    String phone,
    String email,
    String message,
  );
}
