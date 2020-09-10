import 'package:equatable/equatable.dart';

import 'locale.dart';
import '../helpers.dart';

class Category extends Equatable {
  final int id;
  final int parentId;
  final int treeNodeLevel;
  final int productsCount;
  final Locale name;

  const Category._({
    this.id,
    this.parentId,
    this.treeNodeLevel,
    this.productsCount,
    this.name,
  });

  @override
  List<Object> get props => [
        id,
        parentId,
        treeNodeLevel,
        productsCount,
        name,
      ];

  @override
  bool get stringify => true;

  Category copyWith({
    int id,
    int parentId,
    int treeNodeLevel,
    int productsCount,
    Locale name,
  }) {
    return Category._(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      treeNodeLevel: treeNodeLevel ?? this.treeNodeLevel,
      productsCount: productsCount ?? this.productsCount,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return MapHelper.filterNulls<String, dynamic>({
      'id': id,
      'parentId': parentId,
      'treeNodeLevel': treeNodeLevel,
      'productsCount': productsCount,
      'name': name?.toMap(),
    });
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    map = MapHelper.remap<String, dynamic>(map, _fromMap);
    if (map == null) return null;

    return Category._(
      id: map['id'],
      parentId: map['parentId'],
      treeNodeLevel: map['treeNodeLevel'],
      productsCount: map['productsCount'],
      name: map['name'],
    );
  }
}

Map<String, dynamic> _fromMap(Map<String, dynamic> map) {
  return {
    'id': DynamicHelper.toInt(map['id']),
    'parentId': DynamicHelper.toInt(map['parentId']),
    'treeNodeLevel': DynamicHelper.toInt(map['treeNodeLevel']),
    'productsCount': DynamicHelper.toInt(map['productsCount']),
    'name': Locale.fromMap(map['name']),
  };
}
