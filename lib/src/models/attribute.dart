import 'package:equatable/equatable.dart';

import '../helpers.dart';
import 'locale.dart';

class Attribute extends Equatable {
  final Locale name;
  final List<Locale> options;

  Attribute({this.name, this.options});

  @override
  List<Object> get props => [name, options];

  @override
  bool get stringify => true;

  Attribute copyWith({Locale name, List<Locale> options}) {
    return Attribute(
      name: name ?? this.name,
      options: options ?? this.options,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name?.toMap(),
      'options': ListHelper.mapList<Locale, Map<String, dynamic>>(options, itemMap: (item) => item.toMap()),
    };
  }

  factory Attribute.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return Attribute(
      name: Locale.fromMap(map['name']),
      options: ListHelper.listFrom<Locale>(map['options'], itemMap: (item) => Locale.fromMap(item)),
    );
  }
}
