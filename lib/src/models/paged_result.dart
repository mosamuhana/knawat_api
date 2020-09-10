import 'dart:convert';

import 'package:http/http.dart';

class PagedResult<T> {
  final int total;
  final List<T> items;

  PagedResult._({this.total, this.items});

  factory PagedResult.from(
    Response res, {
    String totalKey = 'total',
    String itemsKey,
    T Function(dynamic) mapFn,
  }) {
    var data = json.decode(res.body);
    if (data == null) return null;

    var _total = data[totalKey];
    var _items = data[itemsKey];

    if (_items is List) {
      return PagedResult._(
        total: _total,
        items: _items.where((x) => x != null).map<T>((x) => mapFn(x)).where((x) => x != null).toList(),
      );
    }

    return null;
  }
}
