import 'dart:convert';

import '../utils.dart';
import 'attribute.dart';

class Variation {
  final String sku;
  final int costPrice;
  final int salePrice;
  final int marketPrice;
  final int weight;
  final List<Attribute> attributes;
  final int quantity;
  final int externalId;
  final int inventoryItemId;

  Variation({
    this.sku,
    this.costPrice,
    this.salePrice,
    this.marketPrice,
    this.weight,
    this.attributes,
    this.quantity,
    this.externalId,
    this.inventoryItemId,
  });

  Variation copyWith({
    String sku,
    int costPrice,
    int salePrice,
    int marketPrice,
    int weight,
    List<Attribute> attributes,
    int quantity,
    int externalId,
    int inventoryItemId,
  }) {
    return Variation(
      sku: sku ?? this.sku,
      costPrice: costPrice ?? this.costPrice,
      salePrice: salePrice ?? this.salePrice,
      marketPrice: marketPrice ?? this.marketPrice,
      weight: weight ?? this.weight,
      attributes: attributes ?? this.attributes,
      quantity: quantity ?? this.quantity,
      externalId: externalId ?? this.externalId,
      inventoryItemId: inventoryItemId ?? this.inventoryItemId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sku': sku,
      'cost_price': costPrice,
      'sale_price': salePrice,
      'market_price': marketPrice,
      'weight': weight,
      'attributes': attributes?.map((x) => x?.toMap())?.toList(),
      'quantity': quantity,
      'externalId': externalId,
      'inventoryItemId': inventoryItemId,
    };
  }

  factory Variation.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Variation(
      sku: map['sku'],
      costPrice: map['cost_price']?.toInt(),
      salePrice: map['sale_price']?.toInt(),
      marketPrice: map['market_price']?.toInt(),
      weight: map['weight']?.toInt(),
      attributes: List<Attribute>.from(map['attributes']?.map((x) => Attribute.fromMap(x))),
      quantity: map['quantity']?.toInt(),
      externalId: map['externalId']?.toInt(),
      inventoryItemId: map['inventoryItemId']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Variation.fromJson(String source) => Variation.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Variation(sku: $sku, cost_price: $costPrice, sale_price: $salePrice, market_price: $marketPrice, weight: $weight, attributes: $attributes, quantity: $quantity, externalId: $externalId, inventoryItemId: $inventoryItemId)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Variation &&
        o.sku == sku &&
        o.costPrice == costPrice &&
        o.salePrice == salePrice &&
        o.marketPrice == marketPrice &&
        o.weight == weight &&
        listEquals(o.attributes, attributes) &&
        o.quantity == quantity &&
        o.externalId == externalId &&
        o.inventoryItemId == inventoryItemId;
  }

  @override
  int get hashCode {
    return sku.hashCode ^
        costPrice.hashCode ^
        salePrice.hashCode ^
        marketPrice.hashCode ^
        weight.hashCode ^
        attributes.hashCode ^
        quantity.hashCode ^
        externalId.hashCode ^
        inventoryItemId.hashCode;
  }
}
