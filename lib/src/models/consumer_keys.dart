import 'dart:convert';

class ConsumerKeys {
  final String consumerKey;
  final String consumerSecret;

  ConsumerKeys({this.consumerKey, this.consumerSecret});

  ConsumerKeys copyWith({String consumerKey, String consumerSecret}) {
    return ConsumerKeys(
      consumerKey: consumerKey ?? this.consumerKey,
      consumerSecret: consumerSecret ?? this.consumerSecret,
    );
  }

  Map<String, dynamic> toMap([bool camelize = false]) {
    if (camelize) {
      return {
        'consumer_key': consumerKey,
        'consumer_secret': consumerSecret,
      };
    }

    return {
      'consumerKey': consumerKey,
      'consumerSecret': consumerSecret,
    };
  }

  factory ConsumerKeys.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ConsumerKeys(
      consumerKey: map['consumerKey'] ?? map['consumer_key'],
      consumerSecret: map['consumerSecret'] ?? map['consumer_secret'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ConsumerKeys.fromJson(String source) => ConsumerKeys.fromMap(json.decode(source));

  @override
  String toString() => 'ConsumerKeys { consumerKey: $consumerKey, consumerSecret: $consumerSecret }';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ConsumerKeys && o.consumerKey == consumerKey && o.consumerSecret == consumerSecret;
  }

  @override
  int get hashCode => consumerKey.hashCode ^ consumerSecret.hashCode;
}
