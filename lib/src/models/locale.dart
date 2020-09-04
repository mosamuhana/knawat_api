import 'package:equatable/equatable.dart';

class Locale extends Equatable {
  final String ar;
  final String tr;
  final String en;

  Locale({this.ar, this.tr, this.en});

  @override
  List<Object> get props => [ar, tr, en];

  @override
  bool get stringify => true;

  Locale copyWith({String ar, String tr, String en}) => Locale(
        ar: ar ?? this.ar,
        tr: tr ?? this.tr,
        en: en ?? this.en,
      );

  Map<String, dynamic> toMap() => {'ar': ar, 'tr': tr, 'en': en};

  factory Locale.fromMap(Map<String, dynamic> map) =>
      map == null ? null : Locale(ar: map['ar'], tr: map['tr'], en: map['en']);
}
