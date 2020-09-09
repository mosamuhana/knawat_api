import '../helpers.dart';

class AddProductsResult {
  final List<String> success;
  final List<String> outOfStock;

  const AddProductsResult._({this.success, this.outOfStock});

  factory AddProductsResult.fromMap(Map<String, dynamic> map) {
    map = MapHelper.remap<String, dynamic>(map, _fromMap);
    if (map == null) return null;

    return AddProductsResult._(
      success: map['success'],
      outOfStock: map['outOfStock'],
    );
  }

  factory AddProductsResult.fromJson(String str) => AddProductsResult.fromMap(JsonHelper.decode(str));
}

Map<String, dynamic> _fromMap(Map<String, dynamic> map) {
  return {
    'success': ListHelper.fromMap<String>(map['success'], map: (x) => x.toString()),
    'outOfStock': ListHelper.fromMap<String>(map['outOfStock'], map: (x) => x.toString()),
  };
}
