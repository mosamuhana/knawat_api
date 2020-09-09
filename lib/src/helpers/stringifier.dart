class Stringifier {
  static String joinList(List<String> list, {String separator = ''}) {
    list = (list ?? []).where((e) => e != null).map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
    if (list.isEmpty) return '';
    return list.join(separator ?? '');
  }
}
