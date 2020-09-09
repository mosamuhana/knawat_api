import 'package:http/http.dart' as http;

class ApiException implements Exception {
  final int code;
  final String type;
  final String message;
  final dynamic data;

  ApiException(this.message, {this.code, this.type, this.data});

  String toString() => "ApiException: { statusCode: $code, type: $type, message: $message }";

  static ApiException from(http.Response res) {
    final code = res.statusCode;

    if (code == 401) {
      return ApiException('Access token is missing or invalid, request new one', code: code);
    }

    return ApiException(res.body, code: code);
  }

  factory ApiException.notFound({String message = 'Not Found', dynamic data}) => ApiException(
        message,
        code: 404,
        type: 'NOT_FOUND',
        data: data,
      );

  factory ApiException.internalError([String message = 'Internal error', String type = 'INTERNAL_ERROR']) =>
      ApiException(message, code: 500, type: type);
}

/*
{
    "name": "NotFoundError",
    "message": "Not found",
    "code": 404,
    "type": "NOT_FOUND"
}
{
    "errors": [
        {
            "message": "Product not found A2KT18A82307-2213-x, \"store: https://mycatalog.store/mmhanna/\" (fetchBySku)!"
        }
    ]
}

*/
