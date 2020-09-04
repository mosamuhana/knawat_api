import 'package:equatable/equatable.dart';

import '../helpers.dart';
import 'attribute.dart';
import 'category.dart';
import 'locale.dart';
import 'variation.dart';

class Product extends Equatable {
  final String sku;
  final DateTime updated;
  final DateTime created;
  final bool archive;
  final String supplier;
  final int taxClass;
  final Locale name;
  final Locale description;
  final List<String> images;
  final List<Category> categories;
  final List<Attribute> attributes;
  final List<Variation> variations;

  @override
  List<Object> get props => [
        sku,
        updated,
        created,
        archive,
        supplier,
        taxClass,
        name,
        description,
        images,
        categories,
        attributes,
        variations,
      ];

  @override
  bool get stringify => true;

  Product({
    this.sku,
    this.updated,
    this.created,
    this.archive,
    this.supplier,
    this.taxClass,
    this.name,
    this.description,
    this.images,
    this.categories,
    this.attributes,
    this.variations,
  });

  Product copyWith({
    String sku,
    DateTime updated,
    DateTime created,
    bool archive,
    String supplier,
    int tax_class,
    Locale name,
    Locale description,
    List<String> images,
    List<Category> categories,
    List<Attribute> attributes,
    List<Variation> variations,
  }) {
    return Product(
      sku: sku ?? this.sku,
      updated: updated ?? this.updated,
      created: created ?? this.created,
      archive: archive ?? this.archive,
      supplier: supplier ?? this.supplier,
      taxClass: tax_class ?? this.taxClass,
      name: name ?? this.name,
      description: description ?? this.description,
      images: images ?? this.images,
      categories: categories ?? this.categories,
      attributes: attributes ?? this.attributes,
      variations: variations ?? this.variations,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sku': sku,
      'updated': DateHelper.toJson(updated),
      'created': DateHelper.toJson(created),
      'archive': archive ?? false,
      'supplier': supplier,
      'tax_class': taxClass,
      'images': images,
      'name': name?.toMap(),
      'description': description?.toMap(),
      'categories': ListHelper.mapList<Category, Map<String, dynamic>>(categories, itemMap: (item) => item.toMap()),
      'attributes': ListHelper.mapList<Attribute, Map<String, dynamic>>(attributes, itemMap: (item) => item.toMap()),
      'variations': ListHelper.mapList<Variation, Map<String, dynamic>>(variations, itemMap: (item) => item.toMap()),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Product(
      sku: map['sku'],
      updated: DateHelper.fromJson(map['updated']),
      created: DateHelper.fromJson(map['created']),
      archive: map['archive'] == true,
      supplier: map['supplier'],
      taxClass: map['tax_class']?.toInt(),
      name: Locale.fromMap(map['name']),
      description: Locale.fromMap(map['description']),
      images: List<String>.from(map['images']),
      categories: ListHelper.listFrom<Category>(map['categories'], itemMap: (item) => Category.fromMap(item)),
      attributes: ListHelper.listFrom<Attribute>(map['attributes'], itemMap: (item) => Attribute.fromMap(item)),
      variations: ListHelper.listFrom<Variation>(map['variations'], itemMap: (item) => Variation.fromMap(item)),
    );
  }
}
