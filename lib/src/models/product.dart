import 'package:equatable/equatable.dart';

import '../helpers.dart';
import 'attribute.dart';
import 'category.dart';
import 'locale.dart';
import 'variation.dart';

class Product extends Equatable {
  final String sku;
  final Locale name;
  final Locale description;
  final List<String> images;
  final DateTime updated;
  final DateTime created;
  final List<Category> categories;
  final List<Attribute> attributes;
  final List<Variation> variations;
  final int externalId;

  final bool archive;
  final String supplier;
  final int taxClass;

  @override
  List<Object> get props => [
        sku,
        name,
        description,
        images,
        updated,
        created,
        categories,
        attributes,
        variations,
        externalId,
        // ...
        archive,
        supplier,
        taxClass,
      ];

  @override
  bool get stringify => true;

  Product({
    this.sku,
    this.name,
    this.description,
    this.images,
    this.updated,
    this.created,
    this.categories,
    this.attributes,
    this.variations,
    this.externalId,
    this.archive, // ...
    this.supplier,
    this.taxClass,
  });

  Product copyWith({
    String sku,
    Locale name,
    Locale description,
    List<String> images,
    DateTime updated,
    DateTime created,
    List<Category> categories,
    List<Attribute> attributes,
    List<Variation> variations,
    int externalId,
    bool archive, // ...
    String supplier,
    int taxClass,
  }) {
    return Product(
      sku: sku ?? this.sku,
      name: name ?? this.name,
      description: description ?? this.description,
      images: images ?? this.images,
      updated: updated ?? this.updated,
      created: created ?? this.created,
      categories: categories ?? this.categories,
      attributes: attributes ?? this.attributes,
      variations: variations ?? this.variations,
      externalId: externalId ?? this.externalId,
      archive: archive ?? this.archive, // ...
      supplier: supplier ?? this.supplier,
      taxClass: taxClass ?? this.taxClass,
    );
  }

  Map<String, dynamic> toMap() {
    return MapHelper.filterNulls<String, dynamic>({
      'sku': sku,
      'name': name?.toMap(),
      'description': description?.toMap(),
      'images': images,
      'updated': DateHelper.toJson(updated),
      'created': DateHelper.toJson(created),
      'categories': ListHelper.toMap<Category>(categories),
      'attributes': ListHelper.toMap<Attribute>(attributes),
      'variations': ListHelper.toMap<Variation>(variations),
      'externalId': externalId,
      'archive': archive ?? false, // ...
      'supplier': supplier,
      'tax_class': taxClass,
    });
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    map = MapHelper.remap<String, dynamic>(map, _fromMap);
    if (map == null) return null;

    return Product(
      sku: map['sku'],
      name: map['name'],
      description: map['description'],
      images: map['images'],
      updated: map['updated'],
      created: map['created'],
      categories: map['categories'],
      attributes: map['attributes'],
      variations: map['variations'],
      externalId: map['externalId'],
      archive: map['archive'],
      supplier: map['supplier'],
      taxClass: map['taxClass'],
    );
  }
}

Map<String, dynamic> _fromMap(Map<String, dynamic> map) {
  return {
    'sku': map['sku'],
    'name': Locale.fromMap(map['name']),
    'description': Locale.fromMap(map['description']),
    'images': List<String>.from(map['images']),
    'updated': DateHelper.fromJson(map['updated']),
    'created': DateHelper.fromJson(map['created']),
    'categories': ListHelper.fromMap<Category>(map['categories'], map: (item) => Category.fromMap(item)),
    'attributes': ListHelper.fromMap<Attribute>(map['attributes'], map: (item) => Attribute.fromMap(item)),
    'variations': ListHelper.fromMap<Variation>(map['variations'], map: (item) => Variation.fromMap(item)),
    'externalId': DynamicHelper.toInt(map['externalId']),
    'archive': map['archive'] == true, // ...
    'supplier': map['supplier'],
    'taxClass': DynamicHelper.toInt(map['tax_class']),
  };
}
