enum FinancialStatus {
  Unpaid,
  Paid,
  PartiallyPaid,
  Voided,
  WalletRefunded,
  WalletPartiallyRefunded,
  Refunded,
  PartiallyRefunded,
}

extension FinancialStatusExt on FinancialStatus {
  String get asString {
    switch (this) {
      case FinancialStatus.Unpaid:
        return 'unpaid';
      case FinancialStatus.Paid:
        return 'paid';
      case FinancialStatus.PartiallyPaid:
        return 'partially_paid';
      case FinancialStatus.Voided:
        return 'voided';
      case FinancialStatus.WalletRefunded:
        return 'wallet_refunded';
      case FinancialStatus.WalletPartiallyRefunded:
        return 'wallet_partially_refunded';
      case FinancialStatus.Refunded:
        return 'refunded';
      case FinancialStatus.PartiallyRefunded:
        return 'partially_refunded';
    }
    return null;
  }
}

FinancialStatus toFinancialStatus(dynamic input) {
  if (input == null) return null;

  switch (input.toString()) {
    case 'unpaid':
      return FinancialStatus.Unpaid;
    case 'paid':
      return FinancialStatus.Paid;
    case 'partially_paid':
      return FinancialStatus.PartiallyPaid;
    case 'voided':
      return FinancialStatus.Voided;
    case 'wallet_refunded':
      return FinancialStatus.WalletRefunded;
    case 'wallet_partially_refunded':
      return FinancialStatus.WalletPartiallyRefunded;
    case 'refunded':
      return FinancialStatus.Refunded;
    case 'partially_refunded':
      return FinancialStatus.PartiallyRefunded;
  }

  return null;
}
