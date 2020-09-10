import 'package:equatable/equatable.dart';

import '../helpers.dart';

class Invoice extends Equatable {
  final String invoiceId;
  final String customerName;
  final String customerId;
  final String status;
  final String invoiceNumber;
  final String referenceNumber;
  final String dueDays;
  // TODO: convert dates
  final String dueDate; // 2019-08-24
  final String date; // 2019-08-24
  final String createdTime; // 2019-08-24
  final String lastModifiedTime; // 2019-08-24
  final String coupon;
  final double total;
  final double balance;
  final double shippingCharge;
  final double adjustment;

  Invoice({
    this.invoiceId,
    this.customerName,
    this.customerId,
    this.status,
    this.invoiceNumber,
    this.referenceNumber,
    this.date,
    this.dueDate,
    this.dueDays,
    this.createdTime,
    this.lastModifiedTime,
    this.coupon,
    this.total,
    this.balance,
    this.shippingCharge,
    this.adjustment,
  });

  @override
  List<Object> get props => [
        invoiceId,
        customerName,
        customerId,
        status,
        invoiceNumber,
        referenceNumber,
        date,
        dueDate,
        dueDays,
        createdTime,
        lastModifiedTime,
        coupon,
        total,
        balance,
        shippingCharge,
        adjustment,
      ];

  @override
  bool get stringify => true;

  Invoice copyWith({
    String invoiceId,
    String customerName,
    String customerId,
    String status,
    String invoiceNumber,
    String referenceNumber,
    String date,
    String dueDate,
    String dueDays,
    String createdTime,
    String lastModifiedTime,
    String coupon,
    double total,
    double balance,
    double shippingCharge,
    double adjustment,
  }) {
    return Invoice(
      invoiceId: invoiceId ?? this.invoiceId,
      customerName: customerName ?? this.customerName,
      customerId: customerId ?? this.customerId,
      status: status ?? this.status,
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
      referenceNumber: referenceNumber ?? this.referenceNumber,
      date: date ?? this.date,
      dueDate: dueDate ?? this.dueDate,
      dueDays: dueDays ?? this.dueDays,
      createdTime: createdTime ?? this.createdTime,
      lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
      coupon: coupon ?? this.coupon,
      total: total ?? this.total,
      balance: balance ?? this.balance,
      shippingCharge: shippingCharge ?? this.shippingCharge,
      adjustment: adjustment ?? this.adjustment,
    );
  }

  Map<String, dynamic> toMap() {
    return MapHelper.filterNulls<String, dynamic>({
      'invoice_id': invoiceId,
      'customer_name': customerName,
      'customer_id': customerId,
      'status': status,
      'invoice_number': invoiceNumber,
      'reference_number': referenceNumber,
      'date': date,
      'due_date': dueDate,
      'due_days': dueDays,
      'created_time': createdTime,
      'last_modified_time': lastModifiedTime,
      'coupon': coupon,
      'total': total,
      'balance': balance,
      'shipping_charge': shippingCharge,
      'adjustment': adjustment,
    });
  }

  factory Invoice.fromMap(Map<String, dynamic> map) {
    map = MapHelper.remap<String, dynamic>(map, _fromMap);
    if (map == null) return null;

    return Invoice(
      invoiceId: map['invoiceId'],
      customerName: map['customerName'],
      customerId: map['customerId'],
      status: map['status'],
      invoiceNumber: map['invoiceNumber'],
      referenceNumber: map['referenceNumber'],
      dueDays: map['dueDays'],
      dueDate: map['dueDate'],
      date: map['date'],
      createdTime: map['createdTime'],
      lastModifiedTime: map['lastModifiedTime'],
      coupon: map['coupon'],
      total: map['total'],
      balance: map['balance'],
      shippingCharge: map['shippingCharge'],
      adjustment: map['adjustment'],
    );
  }
}

Map<String, dynamic> _fromMap(Map<String, dynamic> map) {
  return {
    'invoiceId': map['invoice_id'],
    'customerName': map['customer_name'],
    'customerId': map['customer_id'],
    'status': map['status'],
    'invoiceNumber': map['invoice_number'],
    'referenceNumber': map['reference_number'],
    'dueDate': map['due_date'],
    'dueDays': map['due_days'],
    'date': map['date'],
    'createdTime': map['created_time'],
    'lastModifiedTime': map['last_modified_time'],
    'coupon': map['coupon'],
    'total': DynamicHelper.toDouble(map['total']),
    'balance': DynamicHelper.toDouble(map['balance']),
    'shippingCharge': DynamicHelper.toDouble(map['shipping_charge']),
    'adjustment': DynamicHelper.toDouble(map['adjustment']),
  };
}
