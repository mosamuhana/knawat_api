import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
//import 'package:http/http.dart';

import '../internals.dart';
import '../models.dart';
import 'api.dart';
import '../exceptions.dart';

class HttpService {
  final AuthKeys authKeys;
  Channel _channel;

  HttpService(this.authKeys);

  Future<http.Response> get(
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

  Future<http.Response> delete(
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

  Future<http.Response> head(
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

  Future<http.Response> post(
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

  Future<http.Response> patch(
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

  Future<http.Response> put(
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

  Future<Map<String, String>> _getHeaders(Map<String, String> headers, AuthType auth) async {
    auth ??= AuthType.jwt;

    if (auth == AuthType.none) return API.getHeaders(headers: headers);

    String token;

    if (auth == AuthType.jwt) {
      final channel = await _getChannel();
      token = channel.token;
    } else {
      final bytes = utf8.encode('${authKeys.username}:${authKeys.password}');
      token = base64Encode(bytes);
    }

    return API.getHeaders(
      headers: headers,
      auth: auth,
      token: token,
    );
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
