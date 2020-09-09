import '../helpers.dart';
import '../models/invoice_payment.dart';

class InvoicePaymentResult {
  final List<InvoicePayment> invoicePayments;
  final int code;
  final String message;

  const InvoicePaymentResult._({
    this.invoicePayments,
    this.code,
    this.message,
  });

  factory InvoicePaymentResult.fromMap(Map<String, dynamic> map) {
    map = MapHelper.remap<String, dynamic>(map, _fromMap);
    if (map == null) return null;

    return InvoicePaymentResult._(
      invoicePayments: map['invoicePayments'],
      code: map['code'],
      message: map['message'],
    );
  }

  factory InvoicePaymentResult.fromJson(String json) {
    return InvoicePaymentResult.fromMap(JsonHelper.decode(json));
  }
}

Map<String, dynamic> _fromMap(Map<String, dynamic> map) {
  return {
    'invoicePayments': ListHelper.fromMap<InvoicePayment>(map['categories'], map: (item) => InvoicePayment.fromMap(item)),
    'code': DynamicHelper.toInt(map['code']),
    'message': map['message'],
  };
}
