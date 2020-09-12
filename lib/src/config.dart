class KnawatConfig {
  static String defaultLang = 'en';
  static const List<String> langs = ['en', 'ar', 'tr'];
  static const Map<String, List<String>> langFallbacks = {
    'en': ['tr', 'ar'],
    'ar': ['en', 'tr'],
    'tr': ['ar', 'en'],
  };

  static bool isRtl(String lang) {
    switch (lang) {
      case 'ar':
      case 'he':
        return true;
    }
    return false;
  }
}
