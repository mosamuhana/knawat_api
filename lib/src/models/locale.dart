import 'dart:convert';

class Locale {
  final String ar;
  final String tr;
  final String en;

  Locale({this.ar, this.tr, this.en});

  Locale copyWith({String ar, String tr, String en}) {
    return Locale(
      ar: ar ?? this.ar,
      tr: tr ?? this.tr,
      en: en ?? this.en,
    );
  }

  Map<String, dynamic> toMap() => {'ar': ar, 'tr': tr, 'en': en};

  factory Locale.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return Locale(
      ar: map['ar'],
      tr: map['tr'],
      en: map['en'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Locale.fromJson(String source) => Locale.fromMap(json.decode(source));

  @override
  String toString() => 'Locale { ar: $ar, tr: $tr, en: $en }';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Locale && o.ar == ar && o.tr == tr && o.en == en;
  }

  @override
  int get hashCode => ar.hashCode ^ tr.hashCode ^ en.hashCode;
}
