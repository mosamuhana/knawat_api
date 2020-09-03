import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'api.dart';
import 'exceptions.dart';
import '../models.dart';

class HttpService {
  final AuthKeys authKeys;
  Channel _channel;

  HttpService(this.authKeys);

  Future<Response> get(
    String path, {
    Map<String, String> headers,
    Map<String, String> query,
    AuthType auth,
  }) async {
    return http.get(
      API.getUrl(path, query),
      headers: await _getHeaders(headers, auth),
    );
  }

  Future<Response> delete(
    String path, {
    dynamic body,
    Map<String, String> headers,
    Map<String, String> query,
    AuthType auth,
  }) async {
    return await http.delete(
      API.getUrl(path, query),
      headers: await _getHeaders(headers, auth),
    );
  }

  Future<Response> head(
    String path, {
    dynamic body,
    Map<String, String> headers,
    Map<String, String> query,
    AuthType auth,
  }) async {
    return await http.head(
      API.getUrl(path, query),
      headers: await _getHeaders(headers, auth),
    );
  }

  Future<Response> post(
    String path, {
    dynamic body,
    Map<String, String> headers,
    Map<String, String> query,
    AuthType auth,
  }) async {
    return await http.post(
      API.getUrl(path, query),
      headers: await _getHeaders(headers, auth),
      body: body,
      encoding: utf8,
    );
  }

  Future<Response> patch(
    String path, {
    dynamic body,
    Map<String, String> headers,
    Map<String, String> query,
    AuthType auth,
  }) async {
    return await http.patch(
      API.getUrl(path, query),
      headers: await _getHeaders(headers, auth),
      body: body,
      encoding: utf8,
    );
  }

  Future<Response> put(
    String path, {
    dynamic body,
    Map<String, String> headers,
    Map<String, String> query,
    AuthType auth,
  }) async {
    return await http.put(
      API.getUrl(path, query),
      headers: await _getHeaders(headers, auth),
      body: body,
      encoding: utf8,
    );
  }

  Future<String> read(
    String path, {
    dynamic body,
    Map<String, String> headers,
    Map<String, String> query,
    AuthType auth,
  }) async {
    return await http.read(
      API.getUrl(path, query),
      headers: await _getHeaders(headers, auth),
    );
  }

  Future<Uint8List> readBytes(
    String path, {
    dynamic body,
    Map<String, String> headers,
    Map<String, String> query,
    AuthType auth,
  }) async {
    return await http.readBytes(
      API.getUrl(path, query),
      headers: await _getHeaders(headers, auth),
    );
  }

  ApiException getError(Response res) {
    final code = res.statusCode;

    if (res.statusCode == 401) {
      return ApiException('Access token is missing or invalid, request new one', code: code);
    }

    try {
      final data = jsonDecode(res.body);
      return ApiException(data['message'], code: code, type: data['type']);
    } catch (e) {}

    return ApiException('Error', code: code);
  }

  R getData<T, R>(
    Response res, {
    T Function(dynamic) selector,
    R Function(T) map,
  }) {
    selector ??= (dynamic input) => input as T;
    map ??= (T input) => input as R;
    var data = json.decode(res.body);
    var selected = selector(data);
    return map(selected);

    /*
    List<dynamic> list = data['categories'];
    var a = list.map((map) => Category.fromMap(map)).toList();
    return a;
    */
  }

  Future<Map<String, String>> _getHeaders(Map<String, String> headers, AuthType auth) async {
    final token = await _getToken(auth);
    return API.getHeaders(
      headers: headers,
      auth: auth,
      token: token,
    );
  }

  Future<String> _getToken(AuthType auth) async {
    if (auth == null) return null;

    if (auth == AuthType.jwt) {
      var channel = await _getChannel();
      return channel.token;
    }

    if (authKeys.username == null || authKeys.password == null) {
      throw Exception('can not find a user or password');
    }

    final bytes = utf8.encode('${authKeys.username}:${authKeys.password}');
    return base64Encode(bytes);
  }

  Future<Channel> _getChannel() async {
    if (_channel == null) {
      final url = API.getUrl('/token');

      final keys = ConsumerKeys(
        consumerKey: authKeys.key,
        consumerSecret: authKeys.secret,
      );

      final res = await http.post(
        url,
        body: keys.toJson(),
        headers: API.defaultHeaders,
      );

      if (res.statusCode != 200) {
        throw Exception('${res.body}');
      }

      var data = json.decode(res.body);

      _channel = Channel.fromMap(data['channel']);
    }
    return _channel;
  }
}
