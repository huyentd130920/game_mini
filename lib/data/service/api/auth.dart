import 'package:dio/dio.dart';

abstract class AuthInterceptor extends Interceptor {
  List<Map<String, dynamic>> getAuthInfo(RequestOptions route, String type) {
    if (route.extra.containsKey('secure')) {
      final auth = route.extra['secure'] as List<Map<String, String>>;
      final results = <Map<String, dynamic>>[];
      for (final info in auth) {
        if (info['type'] == type) {
          results.add(info);
        }
      }
      return results;
    }
    return [];
  }
}
