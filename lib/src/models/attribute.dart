import 'package:equatable/equatable.dart';

import '../helpers.dart';
import 'localized_string.dart';

class Attribute extends Equatable {
  final LocalizedString name;
  final List<LocalizedString> options;

  const Attribute._({this.name, this.options});

  @override
  List<Object> get props => [name, options];

  @override
  bool get stringify => true;

  Attribute copyWith({LocalizedString name, List<LocalizedString> options}) {
    return Attribute._(
      name: name ?? this.name,
      options: options ?? this.options,
    );
  }

  Map<String, dynamic> toMap() {
    return MapHelper.filterNulls<String, dynamic>({
      'name': name?.toMap(),
      'options': ListHelper.toMap<LocalizedString>(options),
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
    'name': LocalizedString.fromMap(map['name']),
    'options': ListHelper.fromMap<LocalizedString>(map['options'], map: (item) => LocalizedString.fromMap(item)),
  };
}
