class DynamicHelper {
  static int toInt(dynamic v) {
    if (v != null) {
      if (v is num) {
        if (v is int) {
          return v;
        } else if (v is double) {
          return v.toInt();
        }
      } else if (v is String) {
        int n = int.tryParse(v);
        if (n == null) {
          double d = double.tryParse(v);
          if (d != null) {
            n = d.toInt();
          }
        }
        return n;
      }
    }
    return null;
  }

  static double toDouble(dynamic v) {
    if (v != null) {
      if (v is num) {
        return v.toDouble();
      } else if (v is String) {
        return double.tryParse(v);
      }
    }
    return null;
  }
}
