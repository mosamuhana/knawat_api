import 'dart:convert';

import 'package:http/http.dart';

import '../exceptions.dart';

class JsonHelper {
  static String encode(dynamic data) {
    return json.encode(data);
  }

  static dynamic decode(String str) {
    return json.decode(str);
  }

  static R decodeResponse<T, R>(
    Response res, {
    T Function(dynamic) selector,
    R Function(T) map,
  }) {
    selector ??= (dynamic input) => input as T;
    map ??= (T input) => input as R;
    var data = json.decode(res.body);
    var selected = selector(data);
    return map(selected);
  }

  static List<R> decodeListResponse<R>(
    Response res,
    String key,
    R Function(dynamic) fn,
  ) {
    var data = json.decode(res.body);
    var list = (key == null ? data : data[key]) as List;
    return list.map<R>((v) => fn(v)).toList();
  }

  static R decodeMapResponse<R>(
    Response res,
    String key,
    R Function(dynamic) fn,
  ) {
    var data = json.decode(res.body);
    if (data == null) return null;
    data = (key == null ? data : data[key]);
    if (data == null) return null;
    return fn(data);
  }

  static T tryDecode<T>(Response res, {T Function(dynamic) map, T Function() orElse}) {
    try {
      final data = jsonDecode(res.body);
      return map(data);
    } catch (e) {}

    return orElse?.call() ?? null;
  }

  static String decodeErrors(Response res) {
    return JsonHelper.tryDecode<String>(res, map: (data) {
      final errors = data['errors'] as List<dynamic>;
      final messages = errors?.map((item) => item['message'] as String)?.where((x) => x != null)?.toList();
      return messages?.join('\n');
    });
  }

  static ApiException decodeStatusMessageError(Response res) {
    return JsonHelper.tryDecode<ApiException>(res, map: (data) {
      final status = data['status'];
      final message = data['message'];
      if (status != null && message != null) {
        return ApiException.internalError(message, status);
      }
      return null;
    });
  }
}
