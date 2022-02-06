import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../injection.dart';

class Api {
  final dio = createDio();

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: getIt.get(instanceName: 'baseUrl'),
      receiveTimeout: 15000,
      connectTimeout: 15000,
      sendTimeout: 15000,
    ));

    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    return dio;
  }
}
