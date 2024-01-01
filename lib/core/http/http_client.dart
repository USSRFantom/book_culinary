import 'dart:async';
import 'dart:io';

import 'package:book_culinary/core/http/http_utils.dart';
import 'package:book_culinary/core/http/service_locator.dart';
import 'package:book_culinary/data/repositories/base/data_response.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

void initHttpClient() {
  GetIt.I.registerSingleton<AppHttpClient>(AppHttpClient());
}

AppHttpClient get httpClient => getIt<AppHttpClient>();

class AppHttpClient {
  late Dio _dio;

  Dio get dio => _dio;

  AppHttpClient() {
    HttpOverrides.global = IgnoreCertificateErrorOverrides();

    _dio = Dio(BaseOptions(
      baseUrl: 'https://www.themealdb.com/',
      connectTimeout: const Duration(minutes: 3),
      receiveTimeout: const Duration(minutes: 3),
      sendTimeout: const Duration(minutes: 3),
      contentType: 'application/json',
      headers: <String, dynamic>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    // debug logs interceptor
    _dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true),
    );
  }

  Future<DataResponse<List<T>>> getList<T>(String path, T Function(Map<String, dynamic>) mapper) async {
    try {
      final response = await _dio.get(
        path,
      );
      return handleListResponse(response, mapper);
    } on Exception catch (e) {
      return handleException(e);
    }
  }
}
