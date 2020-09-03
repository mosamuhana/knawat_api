import 'dart:convert';

class StoreFulfillmentService {
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

  String toJson() => json.encode(toMap());

  factory StoreFulfillmentService.fromJson(String source) => StoreFulfillmentService.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StoreFulfillmentService { id: $id, name: $name, email: $email, service_name: $serviceName, handle: $handle, fulfillment_orders_opt_in: $fulfillmentOrdersOptIn, include_pending_stock: $includePendingStock, provider_id: $providerId, location_id: $locationId, callback_url: $callbackUrl, tracking_support: $trackingSupport, inventory_management: $inventoryManagement }';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is StoreFulfillmentService &&
        o.id == id &&
        o.name == name &&
        o.email == email &&
        o.serviceName == serviceName &&
        o.handle == handle &&
        o.fulfillmentOrdersOptIn == fulfillmentOrdersOptIn &&
        o.includePendingStock == includePendingStock &&
        o.providerId == providerId &&
        o.locationId == locationId &&
        o.callbackUrl == callbackUrl &&
        o.trackingSupport == trackingSupport &&
        o.inventoryManagement == inventoryManagement;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        serviceName.hashCode ^
        handle.hashCode ^
        fulfillmentOrdersOptIn.hashCode ^
        includePendingStock.hashCode ^
        providerId.hashCode ^
        locationId.hashCode ^
        callbackUrl.hashCode ^
        trackingSupport.hashCode ^
        inventoryManagement.hashCode;
  }
}
