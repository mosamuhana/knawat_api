import 'dart:convert';

class GetProductsParams {
  final int limit;
  final int page;
  final int lastupdate;

  GetProductsParams({this.limit, this.page, this.lastupdate});

  GetProductsParams copyWith({int limit, int page, int lastupdate}) {
    return GetProductsParams(
      limit: limit ?? this.limit,
      page: page ?? this.page,
      lastupdate: lastupdate ?? this.lastupdate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'limit': limit,
      'page': page,
      'lastupdate': lastupdate,
    };
  }

  factory GetProductsParams.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return GetProductsParams(
      limit: map['limit']?.toInt(),
      page: map['page']?.toInt(),
      lastupdate: map['lastupdate']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory GetProductsParams.fromJson(String source) => GetProductsParams.fromMap(json.decode(source));

  @override
  String toString() => 'GetProductsParams(limit: $limit, page: $page, lastupdate: $lastupdate)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is GetProductsParams && o.limit == limit && o.page == page && o.lastupdate == lastupdate;
  }

  @override
  int get hashCode => limit.hashCode ^ page.hashCode ^ lastupdate.hashCode;
}
