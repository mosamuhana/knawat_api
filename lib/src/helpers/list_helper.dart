import 'package:collection/collection.dart';

class ListHelper {
  static const _deepCollectionEquality = DeepCollectionEquality();

  static bool deepEquals(dynamic a, dynamic b) {
    return _deepCollectionEquality.equals(a, b);
  }

  static List<R> mapList<T, R>(List<T> input, {R Function(T) itemMap, bool nullIfEmpty = false}) {
    if (input == null) return null;
    itemMap ??= (T x) => x as R;
    final output = <R>[];
    input.forEach((item) {
      var ret = itemMap(item);
      if (ret != null) {
        output.add(ret);
      }
    });
    if (nullIfEmpty && output.isEmpty) return null;
    return output;
  }

  static List<R> listFrom<R>(List<dynamic> input, {R Function(dynamic) itemMap, bool nullIfEmpty = false}) {
    if (input == null) return null;
    itemMap ??= (dynamic x) => x as R;
    final output = <R>[];
    input.forEach((item) {
      var ret = itemMap(item);
      if (ret != null) {
        output.add(ret);
      }
    });
    if (nullIfEmpty && output.isEmpty) return null;
    return output;
  }
}
