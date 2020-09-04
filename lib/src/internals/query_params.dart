class QueryParams {
  Map<String, String> _map = {};

  QueryParams();

  int get length => _map.length;

  bool get isEmpty => _map.isEmpty;

  void add(String key, dynamic value) {
    if (value != null) {
      _map[key] = value.toString();
    }
  }

  void addMap(Map<String, dynamic> map) => map.forEach((key, value) => add(key, value));

  void removeKeys(List<String> keys) => _map.removeWhere((key, value) => keys.contains(key));

  void clear(List<String> keys) => _map.clear();

  Map<String, String> toMap([bool nullIfEmpty = true]) {
    if (nullIfEmpty && _map.isEmpty) return null;
    return _map.map((key, value) => MapEntry<String, String>(key, value));
  }

  factory QueryParams.from(Map<String, dynamic> map) {
    if (map == null) return null;
    var q = QueryParams();
    q.addMap(map);
    return q;
  }
}
