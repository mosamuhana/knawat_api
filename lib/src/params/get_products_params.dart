import 'package:equatable/equatable.dart';

import '../helpers.dart';

class GetProductsParams extends Equatable {
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

  @override
  List<Object> get props => [
        limit,
        page,
        lastupdate,
        keyword,
        externalId,
        hasExternalId,
        hideOutOfStock,
        currency,
      ];

  @override
  bool get stringify => true;

  GetProductsParams copyWith({int limit, int page, int lastupdate}) {
    return GetProductsParams(
      limit: limit ?? this.limit,
      page: page ?? this.page,
      lastupdate: lastupdate ?? this.lastupdate,
      keyword: keyword ?? this.keyword,
      externalId: externalId ?? this.externalId,
      hasExternalId: hasExternalId ?? this.hasExternalId,
      hideOutOfStock: hideOutOfStock ?? this.hideOutOfStock,
      currency: currency ?? this.currency,
    );
  }

  Map<String, dynamic> toMap() {
    return MapHelper.filterNulls({
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

  factory GetProductsParams.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return GetProductsParams(
      limit: map['limit']?.toInt(),
      page: map['page']?.toInt(),
      lastupdate: map['lastupdate']?.toInt(),
      keyword: map['keyword'],
      externalId: map['externalId'],
      hasExternalId: map['hasExternalId'] == '1',
      hideOutOfStock: map['hideOutOfStock'] == '1',
      currency: map['currency'],
    );
  }
}
