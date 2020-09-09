class ListHelper {
  static List<R> fromMap<R>(dynamic input, {R Function(dynamic) map, bool nullIfEmpty = true}) {
    if (map == null) throw ArgumentError.notNull('map');

    final output = <R>[];
    if (input is List) {
      input.forEach((item) {
        if (item != null) {
          var value = map(item);
          if (value != null) {
            output.add(value);
          }
        }
      });
    }

    if (nullIfEmpty && output.isEmpty) return null;
    return output;
  }

  static List<Map<String, dynamic>> toMap<T>(List<T> list, {bool nullIfEmpty = true}) {
    final output = <Map<String, dynamic>>[];
    list?.forEach((item) {
      if (item != null) {
        var value = (item as dynamic).toMap() as Map<String, dynamic>;
        if (value != null) {
          output.add(value);
        }
      }
    });

    if (nullIfEmpty && output.isEmpty) return null;
    return output;
  }
}
