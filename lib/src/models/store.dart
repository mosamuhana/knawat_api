import 'package:equatable/equatable.dart';

class Store extends Equatable {
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

  @override
  List<Object> get props => [
        consumerKey,
        consumerSecret,
        created,
        updated,
        stockDate,
        stockStatus,
        priceDate,
        priceStatus,
        salePrice,
        salePriceOperator,
        comparedAtPrice,
        comparedAtPriceOperator,
        currency,
        name,
        externalData,
        languages,
        status,
        type,
        url,
      ];

  @override
  bool get stringify => true;

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
}

class StoreExternalData extends Equatable {
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

  @override
  List<Object> get props => [
        defaultLanguage,
        website,
        timezone,
        shipsToCountries,
        shopifyPlan,
        accessToken,
        fulfillmentService,
        customRepush,
      ];

  @override
  bool get stringify => true;

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
}

class StoreFulfillmentService extends Equatable {
  final int id;
  final String name;
  final String email;
  final String serviceName;
  final String handle;
  final bool fulfillmentOrdersOptIn;
  final bool includePendingStock;
  final int providerId;
  final int locationId;
  final String callbackUrl;
  final bool trackingSupport;
  final bool inventoryManagement;

  StoreFulfillmentService({
    this.id,
    this.name,
    this.email,
    this.serviceName,
    this.handle,
    this.fulfillmentOrdersOptIn,
    this.includePendingStock,
    this.providerId,
    this.locationId,
    this.callbackUrl,
    this.trackingSupport,
    this.inventoryManagement,
  });

  @override
  List<Object> get props => [
        id,
        name,
        email,
        serviceName,
        handle,
        fulfillmentOrdersOptIn,
        includePendingStock,
        providerId,
        locationId,
        callbackUrl,
        trackingSupport,
        inventoryManagement,
      ];

  @override
  bool get stringify => true;

  StoreFulfillmentService copyWith({
    int id,
    String name,
    String email,
    String serviceName,
    String handle,
    bool fulfillmentOrdersOptIn,
    bool includePendingStock,
    int providerId,
    int locationId,
    String callbackUrl,
    bool trackingSupport,
    bool inventoryManagement,
  }) {
    return StoreFulfillmentService(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      serviceName: serviceName ?? this.serviceName,
      handle: handle ?? this.handle,
      fulfillmentOrdersOptIn: fulfillmentOrdersOptIn ?? this.fulfillmentOrdersOptIn,
      includePendingStock: includePendingStock ?? this.includePendingStock,
      providerId: providerId ?? this.providerId,
      locationId: locationId ?? this.locationId,
      callbackUrl: callbackUrl ?? this.callbackUrl,
      trackingSupport: trackingSupport ?? this.trackingSupport,
      inventoryManagement: inventoryManagement ?? this.inventoryManagement,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'service_name': serviceName,
      'handle': handle,
      'fulfillment_orders_opt_in': fulfillmentOrdersOptIn,
      'include_pending_stock': includePendingStock,
      'provider_id': providerId,
      'location_id': locationId,
      'callback_url': callbackUrl,
      'tracking_support': trackingSupport,
      'inventory_management': inventoryManagement,
    };
  }

  factory StoreFulfillmentService.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return StoreFulfillmentService(
      id: map['id']?.toInt(),
      name: map['name'],
      email: map['email'],
      serviceName: map['service_name'],
      handle: map['handle'],
      fulfillmentOrdersOptIn: map['fulfillment_orders_opt_in'],
      includePendingStock: map['include_pending_stock'],
      providerId: map['provider_id']?.toInt(),
      locationId: map['location_id']?.toInt(),
      callbackUrl: map['callback_url'],
      trackingSupport: map['tracking_support'],
      inventoryManagement: map['inventory_management'],
    );
  }
}
