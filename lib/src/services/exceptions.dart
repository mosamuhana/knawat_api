class ApiException implements Exception {
  final int code;
  final String type;
  final String message;

  ApiException(this.message, {this.code, this.type});

  String toString() {
    var message = this.message;
    if (message == null) return "Exception";
    return "ApiException: { statusCode: $code, type: $type, message: $message }";
  }
}

/*
{
    "name": "NotFoundError",
    "message": "Not found",
    "code": 404,
    "type": "NOT_FOUND"
}
*/
