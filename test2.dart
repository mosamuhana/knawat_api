void main() async {
  String str = null;

  print(str.or('N/A'));
}

extension StringExtension on String {
  bool get isEmptyOrNull => this == null || isEmpty;
  String or(String def) => this == null ? def : this;
}
