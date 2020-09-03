import 'dart:convert';

import '../utils.dart';
import 'attribute.dart';
import 'locale.dart';
import 'variation.dart';

class Product {
  final String sku;
  final Locale name;
  final Locale description;
  final List<String> images;
  final String created;
  final String updated;
  final List<Attribute> attributes;
  final List<Variation> variations;
  final int externalId;
  final String externalUrl;

  Product({
    this.sku,
    this.name,
    this.description,
    this.images,
    this.created,
    this.updated,
    this.attributes,
    this.variations,
    this.externalId,
    this.externalUrl,
  });

  Product copyWith({
    String sku,
    Locale name,
    Locale description,
    List<String> images,
    String created,
    String updated,
    List<Attribute> attributes,
    List<Variation> variations,
    int externalId,
    String externalUrl,
  }) {
    return Product(
      sku: sku ?? this.sku,
      name: name ?? this.name,
      description: description ?? this.description,
      images: images ?? this.images,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      attributes: attributes ?? this.attributes,
      variations: variations ?? this.variations,
      externalId: externalId ?? this.externalId,
      externalUrl: externalUrl ?? this.externalUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sku': sku,
      'name': name?.toMap(),
      'description': description?.toMap(),
      'images': images,
      'created': created,
      'updated': updated,
      'attributes': attributes?.map((x) => x?.toMap())?.toList(),
      'variations': variations?.map((x) => x?.toMap())?.toList(),
      'externalId': externalId,
      'externalUrl': externalUrl,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Product(
      sku: map['sku'],
      name: Locale.fromMap(map['name']),
      description: Locale.fromMap(map['description']),
      images: List<String>.from(map['images']),
      created: map['created'],
      updated: map['updated'],
      attributes: List<Attribute>.from(map['attributes']?.map((x) => Attribute.fromMap(x))),
      variations: List<Variation>.from(map['variations']?.map((x) => Variation.fromMap(x))),
      externalId: map['externalId']?.toInt(),
      externalUrl: map['externalUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product { sku: $sku, name: $name, description: $description, images: $images, created: $created, updated: $updated, attributes: $attributes, variations: $variations, externalId: $externalId, externalUrl: $externalUrl }';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Product &&
        o.sku == sku &&
        o.name == name &&
        o.description == description &&
        listEquals(o.images, images) &&
        o.created == created &&
        o.updated == updated &&
        listEquals(o.attributes, attributes) &&
        listEquals(o.variations, variations) &&
        o.externalId == externalId &&
        o.externalUrl == externalUrl;
  }

  @override
  int get hashCode {
    return sku.hashCode ^
        name.hashCode ^
        description.hashCode ^
        images.hashCode ^
        created.hashCode ^
        updated.hashCode ^
        attributes.hashCode ^
        variations.hashCode ^
        externalId.hashCode ^
        externalUrl.hashCode;
  }
}
