import 'package:equatable/equatable.dart';

import '../helpers.dart';
import 'attribute.dart';

class Variation extends Equatable {
  final String sku;
  final double costPrice;
  final double salePrice;
  final double marketPrice;
  final double weight;
  final int quantity;
  final List<Attribute> attributes;

  const Variation._({
    this.sku,
    this.costPrice,
    this.salePrice,
    this.marketPrice,
    this.weight,
    this.quantity,
    this.attributes,
  });

  @override
  List<Object> get props => [
        sku,
        costPrice,
        salePrice,
        marketPrice,
        weight,
        quantity,
        attributes,
      ];

  @override
  bool get stringify => true;

  Variation copyWith({
    String sku,
    double costPrice,
    double salePrice,
    double marketPrice,
    double weight,
    int quantity,
    List<Attribute> attributes,
  }) {
    return Variation._(
      sku: sku ?? this.sku,
      costPrice: costPrice ?? this.costPrice,
      salePrice: salePrice ?? this.salePrice,
      marketPrice: marketPrice ?? this.marketPrice,
      weight: weight ?? this.weight,
      quantity: quantity ?? this.quantity,
      attributes: attributes ?? this.attributes,
    );
  }

  Map<String, dynamic> toMap() {
    return MapHelper.filterNulls<String, dynamic>({
      'sku': sku,
      'cost_price': costPrice,
      'sale_price': salePrice,
      'market_price': marketPrice,
      'weight': weight,
      'quantity': quantity,
      'attributes': ListHelper.toMap<Attribute>(attributes),
    });
  }

  factory Variation.fromMap(Map<String, dynamic> map) {
    map = MapHelper.remap<String, dynamic>(map, _fromMap);
    if (map == null) return null;

    return Variation._(
      sku: map['sku'],
      costPrice: map['costPrice'],
      salePrice: map['salePrice'],
      marketPrice: map['marketPrice'],
      weight: map['weight'],
      quantity: map['quantity'],
      attributes: map['attributes'],
    );
  }
}

Map<String, dynamic> _fromMap(Map<String, dynamic> map) {
  return {
    'sku': map['sku'],
    'costPrice': DynamicHelper.toDouble(map['cost_price']),
    'salePrice': DynamicHelper.toDouble(map['sale_price']),
    'marketPrice': DynamicHelper.toDouble(map['market_price']),
    'weight': DynamicHelper.toDouble(map['weight']),
    'quantity': DynamicHelper.toInt(map['quantity']),
    'attributes': ListHelper.fromMap<Attribute>(map['attributes'], map: (item) => Attribute.fromMap(item)),
  };
}
