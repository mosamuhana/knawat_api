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

  Variation({
    this.sku,
    this.costPrice,
    this.salePrice,
    this.marketPrice,
    this.weight,
    this.quantity,
    this.attributes,
  });

  @override
  List<Object> get props => [sku, costPrice, salePrice, marketPrice, weight, quantity];

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
    return Variation(
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
    return {
      'sku': sku,
      'cost_price': costPrice,
      'sale_price': salePrice,
      'market_price': marketPrice,
      'weight': weight,
      'quantity': quantity,
      'attributes': ListHelper.mapList<Attribute, Map<String, dynamic>>(attributes, itemMap: (item) => item.toMap()),
    };
  }

  factory Variation.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Variation(
      sku: map['sku'],
      costPrice: map['cost_price']?.toDouble(),
      salePrice: map['sale_price']?.toDouble(),
      marketPrice: map['market_price']?.toDouble(),
      weight: map['weight']?.toDouble(),
      quantity: map['quantity']?.toInt(),
      attributes: ListHelper.listFrom<Attribute>(map['attributes'], itemMap: (item) => Attribute.fromMap(item)),
    );
  }
}
