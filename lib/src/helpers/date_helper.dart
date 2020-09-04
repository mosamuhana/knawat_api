class DateHelper {
  static DateTime fromJson(dynamic json) => json == null ? null : DateTime.tryParse(json.toString());

  static String toJson(DateTime date) => date == null ? null : date.toIso8601String();
}
