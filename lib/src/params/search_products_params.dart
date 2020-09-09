import '../helpers.dart';

const SKU_KEYWORD = 'sku.keyword';
const EXTERNAL_ID_KEYWORD = 'externalId.keyword';

class SearchProductsParams {
  final int size;
  final List<String> fields;
  final List<SearchQueryFilter> filter;

  const SearchProductsParams({
    this.size,
    this.fields,
    this.filter,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> query;
    var filters = filter?.map((x) => x?.toMap())?.where((x) => x != null)?.toList();
    if (filters != null && filters.isNotEmpty) {
      query = {'filter': filters};
    }
    return MapHelper.filterNulls({
      'size': size,
      'fields': fields?.isEmpty ?? true ? null : fields,
      'query': query,
    });
  }

  String toJson() {
    var map = toMap();
    return map == null ? null : JsonHelper.encode(map);
  }
}

class SearchQueryFilter {
  final SearchFilterTerm<String> term;
  final SearchFilterTerm<List<String>> terms;

  SearchQueryFilter({this.term, this.terms});

  SearchQueryFilter copyWith({
    SearchFilterTerm<String> term,
    SearchFilterTerm<List<String>> terms,
  }) {
    return SearchQueryFilter(
      term: term ?? this.term,
      terms: terms ?? this.terms,
    );
  }

  Map<String, dynamic> toMap() {
    return MapHelper.filterNulls({
      'term': term?.toMap(),
      'terms': terms?.toMap(),
    });
  }
}

class SearchFilterTerm<T> {
  Map<String, T> _map = {};

  SearchFilterTerm({
    List<T> sku,
    List<T> externalId,
  }) {
    add(sku: sku, externalId: externalId);
  }

  void add({
    List<T> sku,
    List<T> externalId,
  }) {
    if (sku != null) {
      sku.forEach((value) {
        if (value != null) {
          _map[SKU_KEYWORD] = value;
        }
      });
    }
    if (externalId != null) {
      externalId.forEach((value) {
        if (value != null) {
          _map[EXTERNAL_ID_KEYWORD] = value;
        }
      });
    }
  }

  Map<String, dynamic> toMap() {
    var map = _map.map<String, dynamic>((key, value) => MapEntry<String, dynamic>(key, value));
    return MapHelper.filterNulls(map);
  }
}

/*
class KeywordTerm {
  Map<String, String> _map = {};

  KeywordTerm({
    List<String> sku,
    List<String> externalId,
  }) {
    add(sku: sku, externalId: externalId);
  }

  void add({
    List<String> sku,
    List<String> externalId,
  }) {
    if (sku != null) {
      sku.forEach((value) => _map[SKU_KEYWORD] = value);
    }
    if (externalId != null) {
      externalId.forEach((value) => _map[EXTERNAL_ID_KEYWORD] = value);
    }
  }

  Map<String, dynamic> toMap() => _map.map((key, value) => MapEntry(key, value));
}

class KeywordTerms {
  Map<String, List<String>> _map = {};

  KeywordTerms({
    List<List<String>> sku,
    List<List<String>> externalId,
  }) {
    add(sku: sku, externalId: externalId);
  }

  void add({
    List<List<String>> sku,
    List<List<String>> externalId,
  }) {
    if (sku != null) {
      sku.forEach((value) => _map[SKU_KEYWORD] = value);
    }
    if (externalId != null) {
      externalId.forEach((value) => _map[EXTERNAL_ID_KEYWORD] = value);
    }
  }

  Map<String, dynamic> toMap() => _map.map((key, value) => MapEntry(key, value));
}
*/
