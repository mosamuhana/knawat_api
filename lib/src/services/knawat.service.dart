import '../models.dart';
import 'category.service.dart';
import 'http.service.dart';
import 'my_products.service.dart';

class KnawatService {
  final AuthKeys authKeys;

  HttpService _httpService;
  CategoryService _categories;
  MyProductsService _myProductsService;

  CategoryService get categories => _categories;
  MyProductsService get myProducts => _myProductsService;

  KnawatService(this.authKeys) {
    _httpService = HttpService(authKeys);
    _categories = CategoryService(_httpService);
    _myProductsService = MyProductsService(_httpService);
  }
}
