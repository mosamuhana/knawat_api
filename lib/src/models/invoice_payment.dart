import 'package:equatable/equatable.dart';

import '../helpers.dart';

class InvoicePayment extends Equatable {
  final String invoicePaymentId;
  final String paymentId;
  final String invoiceId;
  final double amountUsed;

  const InvoicePayment._({
    this.invoicePaymentId,
    this.paymentId,
    this.invoiceId,
    this.amountUsed,
  });

  @override
  List<Object> get props => [
        invoicePaymentId,
        paymentId,
        invoiceId,
        amountUsed,
      ];

  @override
  bool get stringify => true;

  InvoicePayment copyWith({
    String invoicePaymentId,
    String paymentId,
    String invoiceId,
    double amountUsed,
  }) {
    return InvoicePayment._(
      invoicePaymentId: invoicePaymentId ?? this.invoicePaymentId,
      paymentId: paymentId ?? this.paymentId,
      invoiceId: invoiceId ?? this.invoiceId,
      amountUsed: amountUsed ?? this.amountUsed,
    );
  }

  Map<String, dynamic> toMap() {
    return MapHelper.filterNulls<String, dynamic>({
      'invoicePaymentId': invoicePaymentId,
      'paymentId': paymentId,
      'invoiceId': invoiceId,
      'amountUsed': amountUsed,
    });
  }

  factory InvoicePayment.fromMap(Map<String, dynamic> map) {
    map = MapHelper.remap<String, dynamic>(map, _fromMap);
    if (map == null) return null;

    return InvoicePayment._(
      invoicePaymentId: map['invoicePaymentId'],
      paymentId: map['paymentId'],
      invoiceId: map['invoiceId'],
      amountUsed: map['amountUsed'],
    );
  }
}

Map<String, dynamic> _fromMap(Map<String, dynamic> map) {
  return {
    'invoicePaymentId': map['invoicePaymentId'],
    'paymentId': map['paymentId'],
    'invoiceId': map['invoiceId'],
    'amountUsed': DynamicHelper.toDouble(map['amountUsed']),
  };
}
