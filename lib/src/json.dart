import 'dart:convert';

import 'package:http/http.dart';

class Json {
  const Json._();

  static R decodeResponse<T, R>(
    Response res, {
    T Function(dynamic) selector,
    R Function(T) map,
  }) {
    selector ??= (dynamic input) => input as T;
    map ??= (T input) => input as R;
    var data = decode(res.body);
    var selected = selector(data);
    return map(selected);
  }

  static dynamic decode(String source) => json.decode(source);

  static String encode(dynamic data) => json.encode(data);
}
