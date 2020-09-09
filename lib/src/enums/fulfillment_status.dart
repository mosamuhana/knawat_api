/*
Pending    pending
Processing processing
Packed     packed
Shipped    shipped
Delivered  delivered
Voided     voided
*/
enum FulfillmentStatus {
  Pending,
  Processing,
  Packed,
  Shipped,
  Delivered,
  Voided,
}

extension FulfillmentStatusExt on FulfillmentStatus {
  String get asString {
    switch (this) {
      case FulfillmentStatus.Pending:
        return 'pending';
      case FulfillmentStatus.Processing:
        return 'processing';
      case FulfillmentStatus.Packed:
        return 'packed';
      case FulfillmentStatus.Shipped:
        return 'shipped';
      case FulfillmentStatus.Delivered:
        return 'delivered';
      case FulfillmentStatus.Voided:
        return 'voided';
    }
    return null;
  }
}

FulfillmentStatus toFulfillmentStatus(dynamic input) {
  if (input == null) return null;

  switch (input.toString()) {
    case 'pending':
      return FulfillmentStatus.Pending;
    case 'processing':
      return FulfillmentStatus.Processing;
    case 'packed':
      return FulfillmentStatus.Packed;
    case 'shipped':
      return FulfillmentStatus.Shipped;
    case 'delivered':
      return FulfillmentStatus.Delivered;
    case 'voided':
      return FulfillmentStatus.Voided;
  }

  return null;
}
