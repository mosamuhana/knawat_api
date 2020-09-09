import 'package:equatable/equatable.dart';

import '../helpers.dart';
import '../enums.dart';
import '../models.dart';

class CreateOrderParams extends Equatable {
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
  final String invoiceUrl;
  final String warningsSnippet;
  final String shippingMethod;
  final String coupon;

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
    this.invoiceUrl,
    this.warningsSnippet,
    this.shippingMethod,
    this.coupon,
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
      ];

  @override
  bool get stringify => true;

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
    String invoiceUrl,
    String warningsSnippet,
    String shippingMethod,
    String coupon,
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
      invoiceUrl: invoiceUrl ?? this.invoiceUrl,
      warningsSnippet: warningsSnippet ?? this.warningsSnippet,
      shippingMethod: shippingMethod ?? this.shippingMethod,
      coupon: coupon ?? this.coupon,
    );
  }

  Map<String, dynamic> toMap() {
    return MapHelper.filterNulls<String, dynamic>({
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
      'invoice_url': invoiceUrl,
      'warningsSnippet': warningsSnippet,
      'shipping_method': shippingMethod,
      'coupon': coupon,
    });
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
      invoiceUrl: map['invoice_url'],
      warningsSnippet: map['warningsSnippet'],
      shippingMethod: map['shipping_method'],
      coupon: map['coupon'],
    );
  }
}

Map<String, dynamic> _fromMap(Map<String, dynamic> map) {
  return {
    'id': map['id'],
    'items': ListHelper.fromMap<OrderItem>(map['items'], map: (item) => OrderItem.fromMap(item)),
    'shipping': ShippingAddress.fromMap(map['shipping']),
    'total': map['total']?.toDouble(),
    'discount': map['discount']?.toInt(),
    'externalId': map['externalId'],
    'createDate': map['createDate'],
    'updateDate': map['updateDate'],
    'notes': map['notes'],
    'adjustment': map['adjustment']?.toInt(),
    'adjustmentDescription': map['adjustmentDescription'],
    'orderNumber': map['orderNumber'],
    'taxTotal': map['taxTotal']?.toInt(),
    'financialStatus': map['financialStatus'],
    'fulfillmentStatus': map['fulfillmentStatus'],
    'invoiceUrl': map['invoice_url'],
    'warningsSnippet': map['warningsSnippet'],
    'shippingMethod': map['shipping_method'],
    'coupon': map['coupon'],
    // ...............
    //'id': DynamicHelper.toInt(map['id']),
    'parentId': DynamicHelper.toInt(map['parentId']),
    'treeNodeLevel': DynamicHelper.toInt(map['treeNodeLevel']),
    'productsCount': DynamicHelper.toInt(map['productsCount']),
    'name': Locale.fromMap(map['name']),
  };
}
