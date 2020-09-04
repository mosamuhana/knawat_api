import '../helpers.dart';

class AddProductsResult {
  final List<String> success;
  final List<String> outOfStock;

  AddProductsResult._({this.success, this.outOfStock});

  factory AddProductsResult.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    final _success = ListHelper.listFrom<String>(map['success'], nullIfEmpty: true);
    final _outOfStock = ListHelper.listFrom<String>(map['outOfStock'], nullIfEmpty: true);

    if (_success == null && _outOfStock == null) return null;

    return AddProductsResult._(success: _success, outOfStock: _outOfStock);
  }

  factory AddProductsResult.fromJson(String str) => AddProductsResult.fromMap(JsonHelper.decode(str));
}
