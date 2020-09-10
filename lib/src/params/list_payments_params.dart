import '../helpers.dart';

class ListPaymentsParams {
  final int limit;
  final int page;
  final String referenceNumber;
  final String paymentMode;

  ListPaymentsParams({
    this.limit,
    this.page,
    this.referenceNumber,
    this.paymentMode,
  });

  Map<String, dynamic> toMap() {
    return MapHelper.filterNulls<String, dynamic>({
      'limit': limit,
      'page': page,
      'reference_number': referenceNumber,
      'payment_mode': paymentMode,
    });
  }
}
