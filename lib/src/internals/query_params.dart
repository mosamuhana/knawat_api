import '../helpers.dart';

class QueryParams {
  final Map<String, String> _map;

  const QueryParams._(Map<String, String> map) : _map = map;

  int get length => _map.length;

  bool get isEmpty => _map.isEmpty;

  void add(String key, dynamic value) {
    if (value != null) {
      _map[key] = value.toString();
    }
  }

  void addMap(Map<String, dynamic> map) => map.forEach((key, value) => add(key, value));

  void removeKeys(List<String> keys) => _map.removeWhere((key, value) => keys.contains(key));

  void remove(String key) => _map.remove(key);

  void clear(List<String> keys) => _map.clear();

  Map<String, String> toMap([bool nullIfEmpty = true]) {
    var map = MapHelper.filterNulls(_map);
    if (map == null) return null;
    if (nullIfEmpty && map.isEmpty) return null;
    return map.map<String, String>((key, value) => MapEntry<String, String>(key, value));
  }

  factory QueryParams.fromMap(Map<String, dynamic> map) {
    var _map = _fromMap(map);
    return _map == null ? null : QueryParams._(_map);
  }
}

Map<String, String> _fromMap(Map<String, dynamic> map) {
  map = MapHelper.remap<String, dynamic>(map);
  if (map == null) return null;

  Map<String, String> _map = {};
  map.forEach((key, value) {
    if (value != null) {
      _map[key] = value.toString();
    }
  });

  return _map.isEmpty ? null : _map;
  //return map.map<String, String>((key, value) => MapEntry<String, String>(key, value.toString()));
}
