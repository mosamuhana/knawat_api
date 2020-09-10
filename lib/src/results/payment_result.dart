import '../helpers.dart';

class PaymentResult {
  final String paymentId;
  final String customerId;
  final String paymentMode;
  final double amount;
  final double unusedAmount;
  final double bankCharges;
  final DateTime date; // Date 2019-08-24
  final String accountId;
  final String accountName;
  final String description;
  final List<PaymentInvoice> invoices;

  PaymentResult({
    this.paymentId,
    this.customerId,
    this.paymentMode,
    this.amount,
    this.unusedAmount,
    this.bankCharges,
    this.date,
    this.accountId,
    this.accountName,
    this.description,
    this.invoices,
  });

  factory PaymentResult.fromMap(Map<String, dynamic> map) {
    map = MapHelper.remap<String, dynamic>(map, _fromMap);
    if (map == null) return null;

    return PaymentResult(
      paymentId: map['paymentId'],
      customerId: map['customerId'],
      paymentMode: map['paymentMode'],
      amount: map['amount'],
      unusedAmount: map['unusedAmount'],
      bankCharges: map['bankCharges'],
      date: map['date'],
      accountId: map['account_id'],
      accountName: map['account_name'],
      description: map['description'],
      invoices: map['invoices'],
    );
  }

  static Map<String, dynamic> _fromMap(Map<String, dynamic> map) {
    return {
      'paymentId': map['payment_id'],
      'customerId': map['customer_id'],
      'paymentMode': map['payment_mode'],
      'amount': DynamicHelper.toDouble(map['amount']),
      'unusedAmount': DynamicHelper.toDouble(map['unused_amount']),
      'bankCharges': DynamicHelper.toDouble(map['bank_charges']),
      'date': DateHelper.fromJson(map['date']),
      'accountId': map['account_id'],
      'accountName': map['account_name'],
      'description': map['description'],
      'invoices': ListHelper.fromMap<PaymentInvoice>(map['invoices'], map: (item) => PaymentInvoice.fromMap(item)),
    };
  }
}

class PaymentInvoice {
  final double amountApplied;
  final String invoiceId;

  PaymentInvoice({
    this.amountApplied,
    this.invoiceId,
  });

  factory PaymentInvoice.fromMap(Map<String, dynamic> map) {
    map = MapHelper.remap<String, dynamic>(map, _fromMap);
    if (map == null) return null;

    return PaymentInvoice(
      amountApplied: map['amountApplied'],
      invoiceId: map['invoiceId'],
    );
  }

  static Map<String, dynamic> _fromMap(Map<String, dynamic> map) {
    return {
      'amountApplied': DynamicHelper.toDouble(map['amount_applied']),
      'invoiceId': map['invoice_id'],
    };
  }
}
