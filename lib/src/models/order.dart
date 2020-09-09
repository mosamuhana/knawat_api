import 'package:equatable/equatable.dart';

import '../enums.dart';
import '../helpers.dart';
import '../models.dart';

class Order extends Equatable {
  final String id; // Knawat Order ID
  final List<OrderItem> items; // (required) Array of objects non-empty
  final ShippingAddress shipping; // (required)
  final double total;
  final int discount;
  final String externalId; // Order ID in your store
  final DateTime createDate;
  final DateTime updateDate;
  final String notes; // Extra guide for the customer or store owner for Knawat warehouse team
  final int adjustment; // Prices adjustment, could be positive or negative
  final String adjustmentDescription; // Why we made this adjustment
  final String orderNumber; // (required) Knawat readable order number
  final int taxTotal;
  final FinancialStatus financialStatus;
  final FulfillmentStatus fulfillmentStatus;
  final String invoiceUrl; // Optional invoice to print with the order
  final String warningsSnippet;
  final String shippingMethod;
  final String coupon; // Do you have Knawat coupon code? accepted only before order got paid
  final DateTime
      shipmentDate; // Expected shipping date, could be updated depend on payment date, suppliers status or high demand time.
  final String trackingNumber;
  final String
      warnings; // Json stringified order warnings, including error key, optional SKU, and extra info depend on each error

  Order({
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
    this.invoiceUrl,
    this.warningsSnippet,
    this.shippingMethod,
    this.coupon,
    this.shipmentDate,
    this.trackingNumber,
    this.warnings,
  });

  @override
  List<Object> get props => [
        id,
        items,
        shipping,
        total,
        discount,
        externalId,
        createDate,
        updateDate,
        notes,
        adjustment,
        adjustmentDescription,
        orderNumber,
        taxTotal,
        financialStatus,
        fulfillmentStatus,
        invoiceUrl,
        warningsSnippet,
        shippingMethod,
        coupon,
        shipmentDate,
        trackingNumber,
        warnings,
      ];

  @override
  bool get stringify => true;

  Order copyWith({
    String id,
    List<OrderItem> items,
    ShippingAddress shipping,
    double total,
    int discount,
    String externalId,
    DateTime createDate,
    DateTime updateDate,
    String notes,
    int adjustment,
    String adjustmentDescription,
    String orderNumber,
    int taxTotal,
    String financialStatus,
    FulfillmentStatus fulfillmentStatus,
    String invoiceUrl,
    String warningsSnippet,
    String shippingMethod,
    String coupon,
    DateTime shipmentDate,
    String trackingNumber,
    String warnings,
  }) {
    return Order(
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
      invoiceUrl: invoiceUrl ?? this.invoiceUrl,
      warningsSnippet: warningsSnippet ?? this.warningsSnippet,
      shippingMethod: shippingMethod ?? this.shippingMethod,
      coupon: coupon ?? this.coupon,
      shipmentDate: shipmentDate ?? this.shipmentDate,
      trackingNumber: trackingNumber ?? this.trackingNumber,
      warnings: warnings ?? this.warnings,
    );
  }

  Map<String, dynamic> toMap() {
    return MapHelper.filterNulls<String, dynamic>({
      'id': id,
      'items': ListHelper.toMap<OrderItem>(items),
      'shipping': shipping?.toMap(),
      'total': total,
      'discount': discount,
      'externalId': externalId,
      'createDate': DateHelper.toJson(createDate),
      'updateDate': DateHelper.toJson(updateDate),
      'notes': notes,
      'adjustment': adjustment,
      'adjustmentDescription': adjustmentDescription,
      'orderNumber': orderNumber,
      'taxTotal': taxTotal,
      'financialStatus': financialStatus.asString,
      'fulfillmentStatus': fulfillmentStatus.asString,
      'invoice_url': invoiceUrl,
      'warningsSnippet': warningsSnippet,
      'shipping_method': shippingMethod,
      'coupon': coupon,
      'shipment_date': DateHelper.toJson(shipmentDate),
      'trackingNumber': trackingNumber,
      'warnings': warnings,
    });
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    map = MapHelper.remap<String, dynamic>(map, _fromMap);
    if (map == null) return null;

    return Order(
      id: map['id'],
      items: map['items'],
      shipping: map['shipping'],
      total: map['total'],
      discount: map['discount'],
      externalId: map['externalId'],
      createDate: map['createDate'],
      updateDate: map['updateDate'],
      notes: map['notes'],
      adjustment: map['adjustment'],
      adjustmentDescription: map['adjustmentDescription'],
      orderNumber: map['orderNumber'],
      taxTotal: map['taxTotal'],
      financialStatus: map['financialStatus'],
      fulfillmentStatus: map['fulfillmentStatus'],
      invoiceUrl: map['invoiceUrl'],
      warningsSnippet: map['warningsSnippet'],
      shippingMethod: map['shippingMethod'],
      coupon: map['coupon'],
      shipmentDate: map['shipmentDate'],
      trackingNumber: map['trackingNumber'],
      warnings: map['warnings'],
    );
  }

  factory Order.fromJson(String json) {
    try {
      return Order.fromMap(JsonHelper.decode(json));
    } catch (e) {}
    return null;
  }
}

Map<String, dynamic> _fromMap(Map<String, dynamic> map) {
  return {
    'id': map['id'],
    'items': ListHelper.fromMap<OrderItem>(map['items'], map: (item) => OrderItem.fromMap(item)),
    'shipping': ShippingAddress.fromMap(map['shipping']),
    'total': DynamicHelper.toDouble(map['total']),
    'discount': DynamicHelper.toInt(map['discount']),
    'externalId': map['externalId'],
    'createDate': DateHelper.fromJson(map['createDate']),
    'updateDate': DateHelper.fromJson(map['updateDate']),
    'notes': map['notes'],
    'adjustment': DynamicHelper.toInt(map['adjustment']),
    'adjustmentDescription': map['adjustmentDescription'],
    'orderNumber': map['orderNumber'],
    'taxTotal': DynamicHelper.toInt(map['taxTotal']),
    'financialStatus': toFinancialStatus(map['financialStatus']),
    'fulfillmentStatus': toFulfillmentStatus(map['fulfillmentStatus']),
    'invoiceUrl': map['invoice_url'],
    'warningsSnippet': map['warningsSnippet'],
    'shippingMethod': map['shipping_method'],
    'coupon': map['coupon'],
    'shipmentDate': DateHelper.fromJson(map['shipment_date']),
    'trackingNumber': map['trackingNumber'],
    'warnings': map['warnings'],
  };
}
