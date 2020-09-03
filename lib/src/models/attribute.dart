import 'dart:convert';

import '../utils.dart';
import 'locale.dart';

class Attribute {
  final Locale name;
  final List<Locale> options;

  Attribute({this.name, this.options});

  Attribute copyWith({Locale name, List<Locale> options}) {
    return Attribute(
      name: name ?? this.name,
      options: options ?? this.options,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name?.toMap(),
      'options': options?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory Attribute.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Attribute(
      name: Locale.fromMap(map['name']),
      options: List<Locale>.from(map['options']?.map((x) => Locale.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Attribute.fromJson(String source) => Attribute.fromMap(json.decode(source));

  @override
  String toString() => 'Attribute { name: $name, options: $options }';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Attribute && o.name == name && listEquals(o.options, options);
  }

  @override
  int get hashCode => name.hashCode ^ options.hashCode;
}
