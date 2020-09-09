enum OrderSortBy {
  CreatedTime,
  CustomerName,
  SalesorderNumber,
  ShipmentDate,
  Total,
  Date,
}

extension OrderSortExt on OrderSortBy {
  String get asString {
    switch (this) {
      case OrderSortBy.CreatedTime:
        return 'created_time';
      case OrderSortBy.CustomerName:
        return 'customer_name';
      case OrderSortBy.SalesorderNumber:
        return 'salesorder_number';
      case OrderSortBy.ShipmentDate:
        return 'shipment_date';
      case OrderSortBy.Total:
        return 'total';
      case OrderSortBy.Date:
        return 'date';
    }
    return null;
  }
}

OrderSortBy orderSortByFromString(String str) {
  if (str == null) return null;

  switch (str) {
    case 'created_time':
      return OrderSortBy.CreatedTime;
    case 'customer_name':
      return OrderSortBy.CustomerName;
    case 'salesorder_number':
      return OrderSortBy.SalesorderNumber;
    case 'shipment_date':
      return OrderSortBy.ShipmentDate;
    case 'total':
      return OrderSortBy.Total;
    case 'date':
      return OrderSortBy.Date;
  }

  return null;
}
