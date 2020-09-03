import 'dart:convert';

import 'locale.dart';

class Category {
  final int id;
  final Locale name;
  final int parentId;
  final int productsCount;
  final int treeNodeLevel;

  Category({
    this.id,
    this.name,
    this.parentId,
    this.productsCount,
    this.treeNodeLevel,
  });

  Category copyWith({
    int id,
    Locale name,
    int parentId,
    int productsCount,
    int treeNodeLevel,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      parentId: parentId ?? this.parentId,
      productsCount: productsCount ?? this.productsCount,
      treeNodeLevel: treeNodeLevel ?? this.treeNodeLevel,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name?.toMap(),
      'parentId': parentId,
      'productsCount': productsCount,
      'treeNodeLevel': treeNodeLevel,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Category(
      id: map['id']?.toInt(),
      name: Locale.fromMap(map['name']),
      parentId: map['parentId']?.toInt(),
      productsCount: map['productsCount']?.toInt(),
      treeNodeLevel: map['treeNodeLevel']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) => Category.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Category { id: $id, name: $name, parentId: $parentId, productsCount: $productsCount, treeNodeLevel: $treeNodeLevel }';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Category &&
        o.id == id &&
        o.name == name &&
        o.parentId == parentId &&
        o.productsCount == productsCount &&
        o.treeNodeLevel == treeNodeLevel;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ parentId.hashCode ^ productsCount.hashCode ^ treeNodeLevel.hashCode;
  }
}
