enum OrderStatus {
  Draft,
  Open,
  Invoiced,
  PartiallyInvoiced,
  Void,
  Overdue,
}

extension OrderStatusExt on OrderStatus {
  String get asString {
    switch (this) {
      case OrderStatus.Draft:
        return 'draft';
      case OrderStatus.Open:
        return 'open';
      case OrderStatus.Invoiced:
        return 'invoiced';
      case OrderStatus.PartiallyInvoiced:
        return 'partially_invoiced';
      case OrderStatus.Void:
        return 'void';
      case OrderStatus.Overdue:
        return 'overdue';
    }
    return null;
  }
}

OrderStatus toOrderStatus(dynamic input) {
  if (input == null) return null;

  switch (input.toString()) {
    case 'draft':
      return OrderStatus.Draft;
    case 'open':
      return OrderStatus.Open;
    case 'invoiced':
      return OrderStatus.Invoiced;
    case 'partially_invoiced':
      return OrderStatus.PartiallyInvoiced;
    case 'void':
      return OrderStatus.Void;
    case 'overdue':
      return OrderStatus.Overdue;
  }

  return null;
}
