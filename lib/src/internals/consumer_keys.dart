import 'package:equatable/equatable.dart';

import '../helpers.dart';

class ConsumerKeys extends Equatable {
  final String consumerKey;
  final String consumerSecret;

  const ConsumerKeys._({this.consumerKey, this.consumerSecret});

  @override
  List<Object> get props => [consumerKey, consumerSecret];

  @override
  bool get stringify => true;

  ConsumerKeys copyWith({String consumerKey, String consumerSecret}) {
    return ConsumerKeys._(
      consumerKey: consumerKey ?? this.consumerKey,
      consumerSecret: consumerSecret ?? this.consumerSecret,
    );
  }

  Map<String, dynamic> toMap([bool camelize = false]) {
    Map<String, dynamic> map;
    if (camelize) {
      map = {
        'consumer_key': consumerKey,
        'consumer_secret': consumerSecret,
      };
    } else {
      map = {
        'consumerKey': consumerKey,
        'consumerSecret': consumerSecret,
      };
    }
    return MapHelper.filterNulls(map);
  }

  factory ConsumerKeys.fromMap(Map<String, dynamic> map) {
    map = MapHelper.filterNulls(map);
    if (map == null) return null;

    return ConsumerKeys._(
      consumerKey: map['consumerKey'] ?? map['consumer_key'],
      consumerSecret: map['consumerSecret'] ?? map['consumer_secret'],
    );
  }
}
