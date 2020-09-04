import '../helpers.dart';

class UpdateProductParams {
  final String externalUrl;
  final String externalId;
  final List<String> error;
  final List<UpdateProductVariation> variations;

  UpdateProductParams({this.externalUrl, this.externalId, this.error, this.variations});

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (externalUrl != null) map['externalUrl'] = externalUrl;
    if (externalId != null) map['externalId'] = externalId;
    final _error = ListHelper.mapList<String, String>(error, nullIfEmpty: true);
    if (_error != null) map['error'] = _error;
    final _variations = ListHelper.mapList<UpdateProductVariation, Map<String, dynamic>>(
      variations,
      itemMap: (item) => item.toMap(),
      nullIfEmpty: true,
    );
    if (_variations != null) map['variations'] = _variations;

    return map.isEmpty ? null : map;
  }

  String toJson() {
    final map = toMap();
    return map == null ? null : JsonHelper.encode(map);
  }
}

class BulkUpdateProductParams {
  final String sku;
  final String externalUrl;
  final String externalId;
  final List<String> error;
  final List<UpdateProductVariation> variations;

  BulkUpdateProductParams({
    this.sku,
    this.externalUrl,
    this.externalId,
    this.error,
    this.variations,
  }) : assert(sku != null);

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (sku != null) map['sku'] = sku;
    if (externalUrl != null) map['externalUrl'] = externalUrl;
    if (externalId != null) map['externalId'] = externalId;
    final _error = ListHelper.mapList<String, String>(error, nullIfEmpty: true);
    if (_error != null) map['error'] = _error;
    final _variations = ListHelper.mapList<UpdateProductVariation, Map<String, dynamic>>(
      variations,
      itemMap: (item) => item.toMap(),
      nullIfEmpty: true,
    );
    if (_variations != null) map['variations'] = _variations;

    return map.isEmpty ? null : map;
  }

  static String listToJson(List<BulkUpdateProductParams> list) {
    if (list == null || list.isEmpty) return null;
    final dataList = list.map((item) => item.toMap()).where((x) => x != null).toList();
    if (dataList.isEmpty) return null;
    return JsonHelper.encode(dataList);
  }
}

class UpdateProductVariation {
  final String sku;
  final String externalId;

  UpdateProductVariation({this.sku, this.externalId});

  Map<String, dynamic> toMap() {
    return {
      'sku': sku,
      'externalId': externalId,
    };
  }
}
