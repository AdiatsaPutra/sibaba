import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:sibaba/applications/kontak_kami/exception/kontak_kami_exception.dart';
import 'package:sibaba/applications/kontak_kami/models/info_kontak.dart';
import 'package:sibaba/applications/kontak_kami/models/message.dart';
import 'package:sibaba/applications/kontak_kami/models/request/kontak_request.dart';
import 'package:sibaba/applications/kontak_kami/repository/kontak_kami_repo.dart';
import 'package:sibaba/infrastructures/api.dart';

import '../../../injection.dart';

@Injectable(as: KontakKamiRepo)
class KontakKamiRepoImpl extends KontakKamiRepo {
  String baseUrl = getIt.get(instanceName: 'baseUrl');
  final dio = Api.createDio();
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

  @override
  Future<Either<KontakException, void>> sendMessage(
      String fullName, String phone, String email, String message) async {
    try {
      final params = {
        "Fullname": fullName,
        "Phone": phone,
        "Email": email,
        "Message": message,
      };
      final response = await dio.post(
        baseUrl + "message",
        data: jsonEncode(params),
      );
      if (response.statusCode != 200) {
        throw KontakException(response.data);
      }
      return right(null);
    } catch (e) {
      return left(KontakException(e.toString()));
    }
  }

  @override
  Future<Either<KontakException, List<Message>>> getMessage() async {
    try {
      final response = await dio.get(
        baseUrl + "message",
      );
      if (response.statusCode != 200) {
        throw KontakException(response.data);
      }
      List data = response.data['data'];
      final message = data.map((e) => Message.fromMap(e)).toList();
      return right(message);
    } catch (e) {
      return left(KontakException(e.toString()));
    }
  }

  @override
  Future<Either<KontakException, void>> updateKontak(
      KontakRequest kontakRequest) async {
    try {
      final response = await dio.put(
        baseUrl + "kontak",
        data: kontakRequest.toJson(),
      );
      if (response.statusCode != 200) {
        throw KontakException(response.data);
      }
      return right(null);
    } catch (e) {
      return left(KontakException(e.toString()));
    }
  }
}
