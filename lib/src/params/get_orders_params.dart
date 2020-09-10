import '../helpers.dart';
import '../enums.dart';

class GetOrdersParams {
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
