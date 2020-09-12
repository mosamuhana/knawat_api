import 'package:equatable/equatable.dart';

import '../config.dart';
import '../constants.dart';
import '../helpers.dart';

// ignore: must_be_immutable
class LocalizedString extends Equatable {
  String _lang;
  final String ar;
  final String tr;
  final String en;

  LocalizedString._({this.ar, this.tr, this.en}) : _lang = _getLang(ar: ar, tr: tr, en: en);

  String get asString => toString(); //en ?? ar ?? tr ?? '';

  String get lang => _lang;

  bool get isRtl => KnawatConfig.isRtl(lang);

  @override
  List<Object> get props => [ar, tr, en];

  //@override bool get stringify => true;

  @override
  String toString() {
    switch (lang) {
      case LANG_EN:
        return en;
      case LANG_AR:
        return ar;
      case LANG_TR:
        return tr;
    }
    return '';
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

String _getLang({String en, String ar, String tr}) {
  switch (KnawatConfig.defaultLang) {
    case LANG_AR:
      if (ar != null) {
        return LANG_AR;
      } else if (tr != null) {
        return LANG_TR;
      } else if (en != null) {
        return LANG_EN;
      }
      break;
    case LANG_EN:
      if (en != null) {
        return LANG_EN;
      } else if (tr != null) {
        return LANG_TR;
      } else if (ar != null) {
        return LANG_AR;
      }
      break;
    case LANG_TR:
      if (tr != null) {
        return LANG_TR;
      } else if (en != null) {
        return LANG_EN;
      } else if (ar != null) {
        return LANG_AR;
      }
      break;
  }
  return null;
}
