import '../models.dart';
import 'category.service.dart';
import 'http.service.dart';
import 'invoice.service.dart';
import 'my_products.service.dart';
import 'order.service.dart';
import 'payment.service.dart';
import 'webhook.service.dart';

class KnawatService {
  final AuthKeys authKeys;

  HttpService _httpService;
  CategoryService _categories;
  MyProductsService _myProducts;
  PaymentService _payments;
  OrderService _orders;
  InvoiceService _invoices;
  WebhookService _webhooks;

  CategoryService get categories => _categories;
  MyProductsService get myProducts => _myProducts;
  PaymentService get payments => _payments;
  OrderService get orders => _orders;
  InvoiceService get invoices => _invoices;
  WebhookService get webhooks => _webhooks;

  KnawatService(this.authKeys) {
    _httpService = HttpService(authKeys);
    _categories = CategoryService(_httpService);
    _myProducts = MyProductsService(_httpService);
    _payments = PaymentService(_httpService);
    _orders = OrderService(_httpService);
    _invoices = InvoiceService(_httpService);
    _webhooks = WebhookService(_httpService);
  }
}
