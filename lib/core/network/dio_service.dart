import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:technicaltest_ummacademy/core/utils/constants.dart';

import 'pretty_dio_logger.dart';
import 'package:dio/dio.dart';

class DioService {
  Dio get dio => _dio();
  GetStorage box = GetStorage();

  Dio _dio() {
    final options = BaseOptions(
      connectTimeout: 60000,
      receiveTimeout: 60000,
      followRedirects: false,
      baseUrl: 'https://api-test.ummacademy.com',
      headers: {"Authorization": "Bearer ${box.read(MyConstants.token)}"},
      validateStatus: (status) {
        return status! < 500;
      },
    );

    var dio = Dio(options);

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        request: true,
        error: true,
        compact: true,
        maxWidth: 150));
    return dio;
  }
}
