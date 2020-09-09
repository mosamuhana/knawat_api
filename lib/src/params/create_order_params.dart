import 'dart:convert';

import '../models.dart';

class CreateOrderParams {
  final String id;
  final List<OrderItem> items;
  final ShippingAddress shipping;
  final double total;
  final int discount;
  final String externalId;
  final String createDate;
  final String updateDate;
  final String notes;
  final int adjustment;
  final String adjustmentDescription;
  final String orderNumber;
  final int taxTotal;
  final String financialStatus;
  final String fulfillmentStatus;
  final String invoice_url;
  final String warningsSnippet;

  CreateOrderParams({
    this.id,
    this.items,
    this.shipping,
    this.total,
    this.discount,
    this.externalId,
    this.createDate,
    this.updateDate,
    this.notes,
    this.adjustment,
    this.adjustmentDescription,
    this.orderNumber,
    this.taxTotal,
    this.financialStatus,
    this.fulfillmentStatus,
    this.invoice_url,
    this.warningsSnippet,
  });

  CreateOrderParams copyWith({
    String id,
    List<OrderItem> items,
    ShippingAddress shipping,
    double total,
    int discount,
    String externalId,
    String createDate,
    String updateDate,
    String notes,
    int adjustment,
    String adjustmentDescription,
    String orderNumber,
    int taxTotal,
    String financialStatus,
    String fulfillmentStatus,
    String invoice_url,
    String warningsSnippet,
  }) {
    return CreateOrderParams(
      id: id ?? this.id,
      items: items ?? this.items,
      shipping: shipping ?? this.shipping,
      total: total ?? this.total,
      discount: discount ?? this.discount,
      externalId: externalId ?? this.externalId,
      createDate: createDate ?? this.createDate,
      updateDate: updateDate ?? this.updateDate,
      notes: notes ?? this.notes,
      adjustment: adjustment ?? this.adjustment,
      adjustmentDescription: adjustmentDescription ?? this.adjustmentDescription,
      orderNumber: orderNumber ?? this.orderNumber,
      taxTotal: taxTotal ?? this.taxTotal,
      financialStatus: financialStatus ?? this.financialStatus,
      fulfillmentStatus: fulfillmentStatus ?? this.fulfillmentStatus,
      invoice_url: invoice_url ?? this.invoice_url,
      warningsSnippet: warningsSnippet ?? this.warningsSnippet,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'items': items?.map((x) => x?.toMap())?.toList(),
      'shipping': shipping?.toMap(),
      'total': total,
      'discount': discount,
      'externalId': externalId,
      'createDate': createDate,
      'updateDate': updateDate,
      'notes': notes,
      'adjustment': adjustment,
      'adjustmentDescription': adjustmentDescription,
      'orderNumber': orderNumber,
      'taxTotal': taxTotal,
      'financialStatus': financialStatus,
      'fulfillmentStatus': fulfillmentStatus,
      'invoice_url': invoice_url,
      'warningsSnippet': warningsSnippet,
    };
  }

  factory CreateOrderParams.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CreateOrderParams(
      id: map['id'],
      items: List<OrderItem>.from(map['items']?.map((x) => OrderItem.fromMap(x))),
      shipping: ShippingAddress.fromMap(map['shipping']),
      total: map['total']?.toDouble(),
      discount: map['discount']?.toInt(),
      externalId: map['externalId'],
      createDate: map['createDate'],
      updateDate: map['updateDate'],
      notes: map['notes'],
      adjustment: map['adjustment']?.toInt(),
      adjustmentDescription: map['adjustmentDescription'],
      orderNumber: map['orderNumber'],
      taxTotal: map['taxTotal']?.toInt(),
      financialStatus: map['financialStatus'],
      fulfillmentStatus: map['fulfillmentStatus'],
      invoice_url: map['invoice_url'],
      warningsSnippet: map['warningsSnippet'],
    );
  }
}
