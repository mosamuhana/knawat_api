import 'dart:convert';

import '../utils.dart';
import 'store_external_data.dart';

class Store {
  final String consumerKey;
  final String consumerSecret;
  final String created;
  final String updated;
  final String stockDate;
  final String stockStatus;
  final String priceDate;
  final String priceStatus;
  final int salePrice;
  final int salePriceOperator;
  final int comparedAtPrice;
  final int comparedAtPriceOperator;
  final String currency;
  final String name;
  final StoreExternalData externalData;
  final List<String> languages;
  final String status;
  final String type;
  final String url;

  Store({
    this.consumerKey,
    this.consumerSecret,
    this.created,
    this.updated,
    this.stockDate,
    this.stockStatus,
    this.priceDate,
    this.priceStatus,
    this.salePrice,
    this.salePriceOperator,
    this.comparedAtPrice,
    this.comparedAtPriceOperator,
    this.currency,
    this.name,
    this.externalData,
    this.languages,
    this.status,
    this.type,
    this.url,
  });

  Store copyWith({
    String consumerKey,
    String consumerSecret,
    String created,
    String updated,
    String stockDate,
    String stockStatus,
    String priceDate,
    String priceStatus,
    int salePrice,
    int salePriceOperator,
    int comparedAtPrice,
    int comparedAtPriceOperator,
    String currency,
    String name,
    StoreExternalData externalData,
    List<String> languages,
    String status,
    String type,
    String url,
  }) {
    return Store(
      consumerKey: consumerKey ?? this.consumerKey,
      consumerSecret: consumerSecret ?? this.consumerSecret,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      stockDate: stockDate ?? this.stockDate,
      stockStatus: stockStatus ?? this.stockStatus,
      priceDate: priceDate ?? this.priceDate,
      priceStatus: priceStatus ?? this.priceStatus,
      salePrice: salePrice ?? this.salePrice,
      salePriceOperator: salePriceOperator ?? this.salePriceOperator,
      comparedAtPrice: comparedAtPrice ?? this.comparedAtPrice,
      comparedAtPriceOperator: comparedAtPriceOperator ?? this.comparedAtPriceOperator,
      currency: currency ?? this.currency,
      name: name ?? this.name,
      externalData: externalData ?? this.externalData,
      languages: languages ?? this.languages,
      status: status ?? this.status,
      type: type ?? this.type,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'consumer_key': consumerKey,
      'consumer_secret': consumerSecret,
      'created': created,
      'updated': updated,
      'stock_date': stockDate,
      'stock_status': stockStatus,
      'price_date': priceDate,
      'price_status': priceStatus,
      'sale_price': salePrice,
      'sale_price_operator': salePriceOperator,
      'compared_at_price': comparedAtPrice,
      'compared_at_price_operator': comparedAtPriceOperator,
      'currency': currency,
      'name': name,
      'external_data': externalData?.toMap(),
      'languages': languages,
      'status': status,
      'type': type,
      'url': url,
    };
  }

  factory Store.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Store(
      consumerKey: map['consumer_key'],
      consumerSecret: map['consumer_secret'],
      created: map['created'],
      updated: map['updated'],
      stockDate: map['stock_date'],
      stockStatus: map['stock_status'],
      priceDate: map['price_date'],
      priceStatus: map['price_status'],
      salePrice: map['sale_price']?.toInt(),
      salePriceOperator: map['sale_price_operator']?.toInt(),
      comparedAtPrice: map['compared_at_price']?.toInt(),
      comparedAtPriceOperator: map['compared_at_price_operator']?.toInt(),
      currency: map['currency'],
      name: map['name'],
      externalData: StoreExternalData.fromMap(map['external_data']),
      languages: List<String>.from(map['languages']),
      status: map['status'],
      type: map['type'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Store.fromJson(String source) => Store.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Store { consumer_key: $consumerKey, consumer_secret: $consumerSecret, created: $created, updated: $updated, stock_date: $stockDate, stock_status: $stockStatus, price_date: $priceDate, price_status: $priceStatus, sale_price: $salePrice, sale_price_operator: $salePriceOperator, compared_at_price: $comparedAtPrice, compared_at_price_operator: $comparedAtPriceOperator, currency: $currency, name: $name, external_data: $externalData, languages: $languages, status: $status, type: $type, url: $url }';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Store &&
        o.consumerKey == consumerKey &&
        o.consumerSecret == consumerSecret &&
        o.created == created &&
        o.updated == updated &&
        o.stockDate == stockDate &&
        o.stockStatus == stockStatus &&
        o.priceDate == priceDate &&
        o.priceStatus == priceStatus &&
        o.salePrice == salePrice &&
        o.salePriceOperator == salePriceOperator &&
        o.comparedAtPrice == comparedAtPrice &&
        o.comparedAtPriceOperator == comparedAtPriceOperator &&
        o.currency == currency &&
        o.name == name &&
        o.externalData == externalData &&
        listEquals(o.languages, languages) &&
        o.status == status &&
        o.type == type &&
        o.url == url;
  }

  @override
  int get hashCode {
    return consumerKey.hashCode ^
        consumerSecret.hashCode ^
        created.hashCode ^
        updated.hashCode ^
        stockDate.hashCode ^
        stockStatus.hashCode ^
        priceDate.hashCode ^
        priceStatus.hashCode ^
        salePrice.hashCode ^
        salePriceOperator.hashCode ^
        comparedAtPrice.hashCode ^
        comparedAtPriceOperator.hashCode ^
        currency.hashCode ^
        name.hashCode ^
        externalData.hashCode ^
        languages.hashCode ^
        status.hashCode ^
        type.hashCode ^
        url.hashCode;
  }
}
