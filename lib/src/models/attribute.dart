import 'package:equatable/equatable.dart';

import '../helpers.dart';
import 'locale.dart';

class Attribute extends Equatable {
  final Locale name;
  final List<Locale> options;

  const Attribute._({this.name, this.options});

  @override
  List<Object> get props => [name, options];

  @override
  bool get stringify => true;

  Attribute copyWith({Locale name, List<Locale> options}) {
    return Attribute._(
      name: name ?? this.name,
      options: options ?? this.options,
    );
  }

  Map<String, dynamic> toMap() {
    return MapHelper.filterNulls<String, dynamic>({
      'name': name?.toMap(),
      'options': ListHelper.toMap<Locale>(options),
    });
  }

  factory Attribute.fromMap(Map<String, dynamic> map) {
    map = MapHelper.remap<String, dynamic>(map, _fromMap);
    if (map == null) return null;

    return Attribute._(
      name: map['name'],
      options: map['options'],
    );
  }
}

Map<String, dynamic> _fromMap(Map<String, dynamic> map) {
  return {
    'name': Locale.fromMap(map['name']),
    'options': ListHelper.fromMap<Locale>(map['options'], map: (item) => Locale.fromMap(item)),
  };
}
