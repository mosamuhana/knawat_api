import '../models.dart';
import 'category.service.dart';
import 'http.service.dart';

class KnawatService {
  final AuthKeys authKeys;

  HttpService _httpService;
  CategoryService _categories;

  CategoryService get categories => _categories;

  KnawatService(this.authKeys) {
    _httpService = HttpService(authKeys);
    _categories = CategoryService(_httpService);
  }
}
