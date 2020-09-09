import 'package:equatable/equatable.dart';

import '../helpers.dart';

class OrderItem extends Equatable {
  final String id;
  final String sku;
  final String name;
  final String description;
  final double rate;
  final int quantity;
  final int discount;
  final double total;
  final String taxId;
  final String taxName;
  final String taxType;
  final int taxPercentage;

  OrderItem({
    this.id,
    this.sku,
    this.name,
    this.description,
    this.rate,
    this.quantity,
    this.discount,
    this.total,
    this.taxId,
    this.taxName,
    this.taxType,
    this.taxPercentage,
  }) : assert(sku != null && quantity > 0);

  List<Object> get props => [
        id,
        sku,
        name,
        description,
        rate,
        quantity,
        discount,
        total,
        taxId,
        taxName,
        taxType,
        taxPercentage,
      ];

  @override
  bool get stringify => true;

  OrderItem copyWith({
    String id,
    String sku,
    String name,
    String description,
    double rate,
    int quantity,
    int discount,
    double total,
    String taxId,
    String taxName,
    String taxType,
    int taxPercentage,
  }) {
    return OrderItem(
      id: id ?? this.id,
      sku: sku ?? this.sku,
      name: name ?? this.name,
      description: description ?? this.description,
      rate: rate ?? this.rate,
      quantity: quantity ?? this.quantity,
      discount: discount ?? this.discount,
      total: total ?? this.total,
      taxId: taxId ?? this.taxId,
      taxName: taxName ?? this.taxName,
      taxType: taxType ?? this.taxType,
      taxPercentage: taxPercentage ?? this.taxPercentage,
    );
  }

  Map<String, dynamic> toMap() {
    return MapHelper.filterNulls({
      'id': id,
      'sku': sku,
      'name': name,
      'description': description,
      'rate': rate,
      'quantity': quantity,
      'discount': discount,
      'total': total,
      'taxId': taxId,
      'taxName': taxName,
      'taxType': taxType,
      'taxPercentage': taxPercentage,
    });
  }

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    map = MapHelper.remap<String, dynamic>(map, _fromMap);
    if (map == null) return null;

    return OrderItem(
      id: map['id'],
      sku: map['sku'],
      name: map['name'],
      description: map['description'],
      rate: map['rate'],
      quantity: map['quantity'],
      discount: map['discount'],
      total: map['total'],
      taxId: map['taxId'],
      taxName: map['taxName'],
      taxType: map['taxType'],
      taxPercentage: map['taxPercentage'],
    );
  }
}

Map<String, dynamic> _fromMap(Map<String, dynamic> map) {
  return {
    'id': map['id'],
    'sku': map['sku'],
    'name': map['name'],
    'description': map['description'],
    'rate': DynamicHelper.toDouble(map['rate']),
    'quantity': DynamicHelper.toInt(map['quantity']),
    'discount': DynamicHelper.toInt(map['discount']),
    'total': DynamicHelper.toDouble(map['total']),
    'taxId': map['taxId'],
    'taxName': map['taxName'],
    'taxType': map['taxType'],
    'taxPercentage': DynamicHelper.toInt(map['taxPercentage']),
  };
}
