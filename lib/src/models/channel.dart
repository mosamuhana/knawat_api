import 'dart:convert';

class Channel {
  final String id;
  final String url;
  final String status;
  final String currency;
  final String token;

  Channel({
    this.id,
    this.url,
    this.status,
    this.currency,
    this.token,
  });

  Channel copyWith({
    String id,
    String url,
    String status,
    String currency,
    String token,
  }) {
    return Channel(
      id: id ?? this.id,
      url: url ?? this.url,
      status: status ?? this.status,
      currency: currency ?? this.currency,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'url': url,
      'status': status,
      'currency': currency,
      'token': token,
    };
  }

  factory Channel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Channel(
      id: map['_id'],
      url: map['url'],
      status: map['status'],
      currency: map['currency'],
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Channel.fromJson(String source) => Channel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Channel { id: $id, url: $url, status: $status, currency: $currency, token: $token }';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Channel && o.id == id && o.url == url && o.status == status && o.currency == currency && o.token == token;
  }

  @override
  int get hashCode {
    return id.hashCode ^ url.hashCode ^ status.hashCode ^ currency.hashCode ^ token.hashCode;
  }
}
