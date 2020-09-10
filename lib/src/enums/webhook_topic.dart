enum WebhookTopic {
  ProductsCreate,
  ProductsPush,
  ProductsDelete,
  OrdersCreate,
  OrdersUpdate,
  OrdersPaid,
  OrdersCancel,
  StoresUpdate,
}

extension WebhookTopicExt on WebhookTopic {
  String get asString {
    switch (this) {
      case WebhookTopic.ProductsCreate:
        return 'products.create';
      case WebhookTopic.ProductsPush:
        return 'products.push';
      case WebhookTopic.ProductsDelete:
        return 'products.delete';
      case WebhookTopic.OrdersCreate:
        return 'orders.create';
      case WebhookTopic.OrdersUpdate:
        return 'orders.update';
      case WebhookTopic.OrdersPaid:
        return 'orders.paid';
      case WebhookTopic.OrdersCancel:
        return 'orders.cancel';
      case WebhookTopic.StoresUpdate:
        return 'stores.update';
    }
    return null;
  }
}

WebhookTopic toWebhookTopic(dynamic input) {
  if (input == null) return null;

  switch (input.toString()) {
    case 'products.create':
      return WebhookTopic.ProductsCreate;
    case 'products.push':
      return WebhookTopic.ProductsPush;
    case 'products.delete':
      return WebhookTopic.ProductsDelete;
    case 'orders.create':
      return WebhookTopic.OrdersCreate;
    case 'orders.update':
      return WebhookTopic.OrdersUpdate;
    case 'orders.paid':
      return WebhookTopic.OrdersPaid;
    case 'orders.cancel':
      return WebhookTopic.OrdersCancel;
    case 'stores.update':
      return WebhookTopic.StoresUpdate;
  }

  return null;
}
