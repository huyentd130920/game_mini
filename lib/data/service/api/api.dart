import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:game_mini/data/service/api/basic_auth.dart';
import 'package:game_mini/data/service/api/oauth.dart';

class Api{
  static const baseUrl = 'http://api.myfeel.me';
  static const Duration timeout = Duration(seconds: 30);
  static const int connectTimeout = 10000;
  final Dio dio;

  Api({
    Dio? dio,
    String? basePathOverride,
    List<Interceptor>? interceptors,
  }) : this.dio = dio ??
      Dio(BaseOptions(
        baseUrl: basePathOverride ?? baseUrl,
        connectTimeout: 5000,
        receiveTimeout: 3000,
      )) {
    if (interceptors == null) {
      this.dio.interceptors.addAll([
        OAuthInterceptor(),
        BasicAuthInterceptor(),
        // ApiKeyAuthInterceptor(),
      ]);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }
  }

  Dio buildDio() {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    return dio;
  }
}