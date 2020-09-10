import '../helpers.dart';

class ListInvoicesParams {
  final int limit;
  final int page;
  final String referenceNumber;
  final String invoiceNumber;

  ListInvoicesParams({
    this.limit,
    this.page,
    this.referenceNumber,
    this.invoiceNumber,
  });

  Map<String, dynamic> toMap() {
    return MapHelper.filterNulls<String, dynamic>({
      'limit': limit,
      'page': page,
      'reference_number': referenceNumber,
      'invoice_number': invoiceNumber,
    });
  }
}
