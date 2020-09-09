import '../helpers.dart';

class UpdateProductParams {
  final String externalUrl;
  final String externalId;
  final List<String> error;
  final List<ProductVariation> variations;

  UpdateProductParams({this.externalUrl, this.externalId, this.error, this.variations});

  Map<String, dynamic> toMap() {
    var map = MapHelper.filterNulls<String, dynamic>({
      'externalUrl': externalUrl,
      'externalId': externalId,
      'error': error,
      'variations': ListHelper.toMap<ProductVariation>(variations),
    });

    return map == null || map.isEmpty ? null : map;
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
  final List<ProductVariation> variations;

  BulkUpdateProductParams({
    this.sku,
    this.externalUrl,
    this.externalId,
    this.error,
    this.variations,
  }) : assert(sku != null);

  Map<String, dynamic> toMap() {
    var map = MapHelper.filterNulls<String, dynamic>({
      'sku': sku,
      'externalUrl': externalUrl,
      'externalId': externalId,
      'error': error,
      'variations': ListHelper.toMap<ProductVariation>(variations),
    });

    return map == null || map.isEmpty ? null : map;
  }

  static String listToJson(List<BulkUpdateProductParams> list) {
    if (list == null || list.isEmpty) return null;
    final dataList = list.map((item) => item.toMap()).where((x) => x != null).toList();
    if (dataList.isEmpty) return null;
    return JsonHelper.encode(dataList);
  }
}

class ProductVariation {
  final String sku;
  final String externalId;

  ProductVariation({this.sku, this.externalId});

  Map<String, dynamic> toMap() {
    return MapHelper.filterNulls({
      'sku': sku,
      'externalId': externalId,
    });
  }
}
