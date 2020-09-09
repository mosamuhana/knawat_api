import 'package:equatable/equatable.dart';

import '../helpers.dart';
import '../config.dart';

class Locale extends Equatable {
  final String ar;
  final String tr;
  final String en;

  String get asString => en ?? ar ?? tr ?? '';

  const Locale._({this.ar, this.tr, this.en});

  @override
  List<Object> get props => [ar, tr, en];

  //@override bool get stringify => true;

  @override
  String toString() => asString;

  Locale copyWith({String ar, String tr, String en}) {
    return Locale._(
      ar: ar ?? this.ar,
      tr: tr ?? this.tr,
      en: en ?? this.en,
    );
  }

  Map<String, dynamic> toMap() {
    return MapHelper.filterNulls<String, dynamic>({
      'ar': ar,
      'tr': tr,
      'en': en,
    });
  }

  factory Locale.fromMap(Map<String, dynamic> map) {
    map = MapHelper.remap<String, dynamic>(map, _fromMap);
    if (map == null) return null;

    return Locale._(
      ar: map['ar'],
      tr: map['tr'],
      en: map['en'],
    );
  }
}

Map<String, dynamic> _fromMap(Map<String, dynamic> map) {
  return {
    'ar': map['ar'],
    'en': map['en'],
    'tr': map['tr'],
  };
}
