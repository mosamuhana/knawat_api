import '../internals.dart';

class API {
  static const String SCHEME = 'https';
  static const String API_HOST = 'mp.knawat.io';
  static const String API_PREFIX = '/api';
  static const String API_BASE_URL = 'https://mp.knawat.io/api';

  static const Map<String, String> defaultHeaders = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  static Map<String, String> getHeaders({Map<String, String> headers, AuthType auth, String token}) {
    auth ??= AuthType.jwt;

    var newHeaders = {
      ...defaultHeaders,
      if (headers != null) ...headers,
    };

    if (token != null) {
      if (auth == AuthType.basic) {
        newHeaders['Authorization'] = 'Basic $token';
      } else if (auth == AuthType.jwt) {
        newHeaders['Authorization'] = 'Bearer $token';
      }
    }

    return newHeaders;
  }

  static String getUrl(String path, [Map<String, String> query]) {
    path = path.startsWith('/') ? path : '/$path';
    var uri = Uri.https(API_HOST, "$API_PREFIX$path", query);
    return uri.toString();
  }
}
