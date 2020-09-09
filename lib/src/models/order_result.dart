import 'package:equatable/equatable.dart';

import '../helpers.dart';

class OrderResult extends Equatable {
  final String id;
  final String externalId;
  final String status;
  final String createDate;
  final String updateDate;
  final int total;
  final String shipmentDate;
  final String knawatOrderStatus;
  final String orderNumber;
  final String invoiceUrl;
  final String financialStatus;
  final String fulfillmentStatus;
  final String trackingNumber;
  final String warningsSnippet;

  OrderResult({
    this.id,
    this.externalId,
    this.status,
    this.createDate,
    this.updateDate,
    this.total,
    this.shipmentDate,
    this.knawatOrderStatus,
    this.orderNumber,
    this.invoiceUrl,
    this.financialStatus,
    this.fulfillmentStatus,
    this.trackingNumber,
    this.warningsSnippet,
  });

  List<Object> get props => [
        id,
        externalId,
        status,
        createDate,
        updateDate,
        total,
        shipmentDate,
        knawatOrderStatus,
        orderNumber,
        invoiceUrl,
        financialStatus,
        fulfillmentStatus,
        trackingNumber,
        warningsSnippet,
      ];

  @override
  bool get stringify => true;

  OrderResult copyWith({
    String id,
    String externalId,
    String status,
    String createDate,
    String updateDate,
    int total,
    String shipmentDate,
    String knawatOrderStatus,
    String orderNumber,
    String invoiceUrl,
    String financialStatus,
    String fulfillmentStatus,
    String trackingNumber,
    String warningsSnippet,
  }) {
    return OrderResult(
      id: id ?? this.id,
      externalId: externalId ?? this.externalId,
      status: status ?? this.status,
      createDate: createDate ?? this.createDate,
      updateDate: updateDate ?? this.updateDate,
      total: total ?? this.total,
      shipmentDate: shipmentDate ?? this.shipmentDate,
      knawatOrderStatus: knawatOrderStatus ?? this.knawatOrderStatus,
      orderNumber: orderNumber ?? this.orderNumber,
      invoiceUrl: invoiceUrl ?? this.invoiceUrl,
      financialStatus: financialStatus ?? this.financialStatus,
      fulfillmentStatus: fulfillmentStatus ?? this.fulfillmentStatus,
      trackingNumber: trackingNumber ?? this.trackingNumber,
      warningsSnippet: warningsSnippet ?? this.warningsSnippet,
    );
  }

  Map<String, dynamic> toMap() {
    return MapHelper.filterNulls({
      'id': id,
      'externalId': externalId,
      'status': status,
      'createDate': createDate,
      'updateDate': updateDate,
      'total': total,
      'shipment_date': shipmentDate,
      'knawat_order_status': knawatOrderStatus,
      'orderNumber': orderNumber,
      'invoice_url': invoiceUrl,
      'financialStatus': financialStatus,
      'fulfillmentStatus': fulfillmentStatus,
      'trackingNumber': trackingNumber,
      'warningsSnippet': warningsSnippet,
    });
  }

  factory OrderResult.fromMap(Map<String, dynamic> map) {
    map = MapHelper.remap<String, dynamic>(map, _fromMap);
    if (map == null) return null;

    return OrderResult(
      id: map['id'],
      externalId: map['externalId'],
      status: map['status'],
      createDate: map['createDate'],
      updateDate: map['updateDate'],
      total: map['total'],
      shipmentDate: map['shipmentDate'],
      knawatOrderStatus: map['knawatOrderStatus'],
      orderNumber: map['orderNumber'],
      invoiceUrl: map['invoiceUrl'],
      financialStatus: map['financialStatus'],
      fulfillmentStatus: map['fulfillmentStatus'],
      trackingNumber: map['trackingNumber'],
      warningsSnippet: map['warningsSnippet'],
    );
  }
}

Map<String, dynamic> _fromMap(Map<String, dynamic> map) {
  return {
    'id': map['id'],
    'externalId': map['externalId'],
    'status': map['status'],
    'createDate': map['createDate'],
    'updateDate': map['updateDate'],
    'total': DynamicHelper.toInt(map['total']),
    'shipmentDate': map['shipment_date'],
    'knawatOrderStatus': map['knawat_order_status'],
    'orderNumber': map['orderNumber'],
    'invoiceUrl': map['invoice_url'],
    'financialStatus': map['financialStatus'],
    'fulfillmentStatus': map['fulfillmentStatus'],
    'trackingNumber': map['trackingNumber'],
    'warningsSnippet': map['warningsSnippet'],
  };
}
