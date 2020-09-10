import 'package:equatable/equatable.dart';

import '../helpers.dart';

class Webhook extends Equatable {
  final String id;
  final String topic;
  final String storeId;
  final String url;
  final DateTime createdAt;
  final DateTime updatedAt;

  Webhook({
    this.id,
    this.topic,
    this.storeId,
    this.url,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object> get props => [
        id,
        topic,
        storeId,
        url,
        createdAt,
        updatedAt,
      ];

  @override
  bool get stringify => true;

  Webhook copyWith({
    String id,
    String topic,
    String storeId,
    String url,
    DateTime createdAt,
    DateTime updatedAt,
  }) {
    return Webhook(
      id: id ?? this.id,
      topic: topic ?? this.topic,
      storeId: storeId ?? this.storeId,
      url: url ?? this.url,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return MapHelper.filterNulls<String, dynamic>({
      'id': id,
      'topic': topic,
      'storeId': storeId,
      'url': url,
      'createdAt': DateHelper.toJson(createdAt),
      'updatedAt': DateHelper.toJson(updatedAt),
    });
  }

  factory Webhook.fromMap(Map<String, dynamic> map) {
    map = MapHelper.remap<String, dynamic>(map, _fromMap);
    if (map == null) return null;

    return Webhook(
      id: map['id'],
      topic: map['topic'],
      storeId: map['storeId'],
      url: map['url'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  factory Webhook.fromJson(String source) => Webhook.fromMap(JsonHelper.decode(source));
}

Map<String, dynamic> _fromMap(Map<String, dynamic> map) {
  return {
    'id': map['id'],
    'topic': map['topic'],
    'storeId': map['storeId'],
    'url': map['url'],
    'createdAt': DateHelper.fromJson(map['createdAt']),
    'updatedAt': DateHelper.fromJson(map['updatedAt']),
  };
}
