import 'package:equatable/equatable.dart';

import 'locale.dart';

class Category extends Equatable {
  final int id;
  final int parentId;
  final int treeNodeLevel;
  final int productsCount;
  final Locale name;

  Category({
    this.id,
    this.parentId,
    this.treeNodeLevel,
    this.productsCount,
    this.name,
  });

  @override
  List<Object> get props => [id, parentId, treeNodeLevel, productsCount, name];

  @override
  bool get stringify => true;

  Category copyWith({
    int id,
    int parentId,
    int treeNodeLevel,
    int productsCount,
    Locale name,
  }) {
    return Category(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      treeNodeLevel: treeNodeLevel ?? this.treeNodeLevel,
      productsCount: productsCount ?? this.productsCount,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'parentId': parentId,
      'treeNodeLevel': treeNodeLevel,
      'productsCount': productsCount,
      'name': name?.toMap(),
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Category(
      id: map['id']?.toInt(),
      parentId: map['parentId']?.toInt(),
      treeNodeLevel: map['treeNodeLevel']?.toInt(),
      productsCount: map['productsCount']?.toInt(),
      name: Locale.fromMap(map['name']),
    );
  }
}
