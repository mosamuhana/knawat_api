import '../helpers.dart';

class GetProductsParams {
  final int limit;
  final int page;
  final int lastupdate;
  final String keyword;
  final String externalId;
  final bool hasExternalId;
  final bool hideOutOfStock;
  final String currency;

  GetProductsParams({
    this.limit,
    this.page,
    this.lastupdate,
    this.keyword,
    this.externalId,
    this.hasExternalId,
    this.hideOutOfStock,
    this.currency,
  });

  Map<String, dynamic> toMap() {
    return MapHelper.filterNulls<String, dynamic>({
      'limit': limit,
      'page': page,
      'lastupdate': lastupdate,
      'keyword': keyword,
      'externalId': externalId,
      'hasExternalId': hasExternalId == true ? 1 : null,
      'hideOutOfStock': hideOutOfStock == true ? 1 : null,
      'currency': currency,
    });
  }
}
