import 'package:equatable/equatable.dart';

class Channel extends Equatable {
  final String id;
  final String url;
  final String status;
  final String currency;
  final String token;

  Channel({this.id, this.url, this.status, this.currency, this.token});

  List<Object> get props => [id, url, status, currency, token];

  @override
  bool get stringify => true;

  Channel copyWith({String id, String url, String status, String currency, String token}) {
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
}
