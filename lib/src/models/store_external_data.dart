import 'dart:convert';

import '../utils.dart';
import 'store_fulfillment_service.dart';

class StoreExternalData {
  final String defaultLanguage;
  final String website;
  final String timezone;
  final List<String> shipsToCountries;
  final String shopifyPlan;
  final String accessToken;
  final StoreFulfillmentService fulfillmentService;
  final bool customRepush;

  StoreExternalData({
    this.defaultLanguage,
    this.website,
    this.timezone,
    this.shipsToCountries,
    this.shopifyPlan,
    this.accessToken,
    this.fulfillmentService,
    this.customRepush,
  });

  StoreExternalData copyWith({
    String defaultLanguage,
    String website,
    String timezone,
    List<String> shipsToCountries,
    String shopifyPlan,
    String accessToken,
    String fulfillmentService,
    bool customRepush,
  }) {
    return StoreExternalData(
      defaultLanguage: defaultLanguage ?? this.defaultLanguage,
      website: website ?? this.website,
      timezone: timezone ?? this.timezone,
      shipsToCountries: shipsToCountries ?? this.shipsToCountries,
      shopifyPlan: shopifyPlan ?? this.shopifyPlan,
      accessToken: accessToken ?? this.accessToken,
      fulfillmentService: fulfillmentService ?? this.fulfillmentService,
      customRepush: customRepush ?? this.customRepush,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'default_language': defaultLanguage,
      'website': website,
      'timezone': timezone,
      'ships_to_countries': shipsToCountries,
      'shopify_plan': shopifyPlan,
      'access_token': accessToken,
      'fulfillmentService': fulfillmentService?.toMap(),
      'custom_repush': customRepush,
    };
  }

  factory StoreExternalData.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return StoreExternalData(
      defaultLanguage: map['default_language'],
      website: map['website'],
      timezone: map['timezone'],
      shipsToCountries: List<String>.from(map['ships_to_countries']),
      shopifyPlan: map['shopify_plan'],
      accessToken: map['access_token'],
      fulfillmentService: StoreFulfillmentService.fromMap(map['fulfillmentService']),
      customRepush: map['custom_repush'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StoreExternalData.fromJson(String source) => StoreExternalData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StoreExternalData { default_language: $defaultLanguage, website: $website, timezone: $timezone, ships_to_countries: $shipsToCountries, shopify_plan: $shopifyPlan, access_token: $accessToken, fulfillmentService: $fulfillmentService, custom_repush: $customRepush }';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is StoreExternalData &&
        o.defaultLanguage == defaultLanguage &&
        o.website == website &&
        o.timezone == timezone &&
        listEquals(o.shipsToCountries, shipsToCountries) &&
        o.shopifyPlan == shopifyPlan &&
        o.accessToken == accessToken &&
        o.fulfillmentService == fulfillmentService &&
        o.customRepush == customRepush;
  }

  @override
  int get hashCode {
    return defaultLanguage.hashCode ^
        website.hashCode ^
        timezone.hashCode ^
        shipsToCountries.hashCode ^
        shopifyPlan.hashCode ^
        accessToken.hashCode ^
        fulfillmentService.hashCode ^
        customRepush.hashCode;
  }
}
