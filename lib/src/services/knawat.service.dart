import '../models.dart';
import 'category.service.dart';
import 'http.service.dart';
import 'my_products.service.dart';
import 'order.service.dart';
import 'payment.service.dart';

class KnawatService {
  final AuthKeys authKeys;

  HttpService _httpService;
  CategoryService _categories;
  MyProductsService _myProductsService;
  PaymentService _payments;
  OrderService _orders;

  CategoryService get categories => _categories;
  MyProductsService get myProducts => _myProductsService;
  PaymentService get payments => _payments;
  OrderService get orders => _orders;

  KnawatService(this.authKeys) {
    _httpService = HttpService(authKeys);
    _categories = CategoryService(_httpService);
    _myProductsService = MyProductsService(_httpService);
    _payments = PaymentService(_httpService);
    _orders = OrderService(_httpService);
  }
}
