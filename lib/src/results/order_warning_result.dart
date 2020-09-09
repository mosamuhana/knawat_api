import '../helpers.dart';

class OrderWarningResult {
  final String message;
  final String sku;
  final OrderWarningData data;

  const OrderWarningResult._({
    this.message,
    this.sku,
    this.data,
  });

  factory OrderWarningResult.fromMap(Map<String, dynamic> map) {
    map = MapHelper.remap<String, dynamic>(map, _fromMap);
    if (map == null) return null;

    return OrderWarningResult._(
      message: map['message'],
      sku: map['sku'],
      data: map['data'],
    );
  }

  static Map<String, dynamic> _fromMap(Map<String, dynamic> map) {
    return {
      'message': map['message'],
      'sku': map['sku'],
      'data': OrderWarningData.fromMap(map['data']),
    };
  }

  static List<OrderWarningResult> listFromJson(String str) {
    var list = JsonHelper.decode(str) as List;
    return list.map((item) => OrderWarningResult.fromMap(item));
  }
}

class OrderWarningData {
  final int availableQuantity;

  OrderWarningData({this.availableQuantity});

  factory OrderWarningData.fromMap(Map<String, dynamic> map) {
    map = MapHelper.remap<String, dynamic>(map, _fromMap);
    if (map == null) return null;

    return OrderWarningData(
      availableQuantity: map['availableQuantity'],
    );
  }

  static Map<String, dynamic> _fromMap(Map<String, dynamic> map) {
    return {
      'availableQuantity': DynamicHelper.toInt(map['available_qty']),
    };
  }
}
