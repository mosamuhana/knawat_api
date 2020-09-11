import 'package:equatable/equatable.dart';

import '../config.dart';
import '../constants.dart';
import '../helpers.dart';

class LocalizedString extends Equatable {
  final String ar;
  final String tr;
  final String en;

  String get asString => toString(); //en ?? ar ?? tr ?? '';

  const LocalizedString._({this.ar, this.tr, this.en});

  @override
  List<Object> get props => [ar, tr, en];

  //@override bool get stringify => true;

  @override
  String toString() {
    switch (KnawatConfig.defaultLang) {
      case LANG_EN:
        return en ?? ar ?? tr ?? '';
      case LANG_AR:
        return ar ?? en ?? tr ?? '';
      case LANG_TR:
        return tr ?? ar ?? en ?? '';
    }
    return ar ?? en ?? tr ?? '';
  }

  LocalizedString copyWith({String ar, String tr, String en}) {
    return LocalizedString._(
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

  factory LocalizedString.fromMap(Map<String, dynamic> map) {
    map = MapHelper.remap<String, dynamic>(map, _fromMap);
    if (map == null) return null;

    return LocalizedString._(
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
