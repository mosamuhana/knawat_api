import 'dart:convert';

import '../utils.dart';
import 'category.dart';

class CategoriesResult {
  final int count;
  final List<Category> categories;

  CategoriesResult({
    this.count,
    this.categories,
  });

  CategoriesResult copyWith({int count, List<Category> categories}) {
    return CategoriesResult(
      count: count ?? this.count,
      categories: categories ?? this.categories,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'categories': categories?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory CategoriesResult.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CategoriesResult(
      count: map['count']?.toInt(),
      categories: List<Category>.from(map['categories']?.map((x) => Category.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriesResult.fromJson(String source) => CategoriesResult.fromMap(json.decode(source));

  @override
  String toString() => 'CategoriesResult(count: $count, categories: $categories)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CategoriesResult && o.count == count && listEquals(o.categories, categories);
  }

  @override
  int get hashCode => count.hashCode ^ categories.hashCode;
}
