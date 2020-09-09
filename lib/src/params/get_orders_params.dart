import 'package:equatable/equatable.dart';

import '../helpers.dart';
import '../enums.dart';

class GetOrdersParams extends Equatable {
  final int limit; // number [ 1 .. 50 ]   Default: 10
  final int page; // number >= 1   Default: 1
  final OrderSortBy sort; // Default: OrderSortBy.created_time
  final SortOrder sortOrder; // Enum: "A" "D"   Default: "D"
  final OrderStatus status;
  final String externalId;

  GetOrdersParams({
    this.limit,
    this.page,
    this.sort,
    this.sortOrder,
    this.status,
    this.externalId,
  });

  @override
  List<Object> get props => [
        limit,
        page,
        sort,
        sortOrder,
        status,
        externalId,
      ];

  @override
  bool get stringify => true;

  GetOrdersParams copyWith({int limit, int page, int lastupdate}) {
    return GetOrdersParams(
      limit: limit ?? this.limit,
      page: page ?? this.page,
      sort: sort ?? this.sort,
      sortOrder: sortOrder ?? this.sortOrder,
      status: status ?? this.status,
      externalId: externalId ?? this.externalId,
    );
  }

  Map<String, dynamic> toMap() {
    return MapHelper.filterNulls<String, dynamic>({
      'limit': limit,
      'page': page,
      'sort': sort?.asString,
      'sortOrder': sortOrder == null ? null : (sortOrder == SortOrder.Asc ? 'A' : 'D'),
      'status': status?.asString,
      'externalId': externalId,
    });
  }
}
