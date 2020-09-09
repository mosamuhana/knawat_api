class MapHelper {
  static bool isEmpty<TKey, TValue>(Map<TKey, TValue> map) {
    return map == null || map.isEmpty;
  }

  static Map<TKey, TValue> filterNulls<TKey, TValue>(Map<TKey, TValue> map) {
    if (isEmpty(map)) return null;

    Map<TKey, TValue> _map = {};

    map.forEach((key, value) {
      if (value != null) {
        _map[key] = value;
      }
    });

    return _map.isEmpty ? null : _map;
  }

  static Map<TKey, TValue> remap<TKey, TValue>(Map<TKey, TValue> map,
      [Map<TKey, TValue> Function(Map<TKey, TValue>) mapFn]) {
    //if (mapFn == null) throw ArgumentError.notNull('mapFn');
    map = filterNulls(map);
    if (!isEmpty(map)) {
      if (mapFn == null) {
        return map;
      } else {
        map = filterNulls(mapFn(map));
        if (!isEmpty(map)) {
          return map;
        }
      }
    }
    return null;
  }
}
