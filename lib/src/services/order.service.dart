import '../helpers.dart';
import '../results.dart';
import '../exceptions.dart';
import '../internals.dart';
import '../models.dart';
import '../params.dart';
import 'http.service.dart';

class OrderService {
  final HttpService httpService;

  OrderService(this.httpService);

  Future<List<OrderResult>> getOrders({GetOrdersParams params}) async {
    var query = QueryParams.fromMap(params?.toMap())?.toMap();
    final res = await httpService.get('/orders', query: query);
    final code = res.statusCode;

    if (code == 200) {
      return ListHelper.fromMap(JsonHelper.decode(res.body), map: (item) => OrderResult.fromMap(item));
    }

    throw ApiException.from(res);
  }

  Future<Order> getOrder(String orderId) async {
    if (orderId == null) throw ArgumentError.notNull('orderId');

    final res = await httpService.get('/orders/$orderId');
    final code = res.statusCode;

    if (code == 200) {
      return Order.fromJson(res.body);
    }

    if (code == 404) {
      throw ApiException.notFound(message: 'Order not found');
    }

    throw ApiException.from(res);
  }

  Future<Order> createOrder(Order order) async {
    if (order == null) throw ArgumentError.notNull('order');

    var orderData = order.toMap();
    if (orderData == null) throw ArgumentError.notNull('order');

    final res = await httpService.post('/orders', body: JsonHelper.encode(orderData));
    final code = res.statusCode;

    if (code == 200) {
      return Order.fromJson(res.body);
    }

    if (code == 404) {
      throw JsonHelper.tryDecode<ApiException>(res, map: (data) {
        final message = data['message'] ?? data['errorMessage'];
        if (message != null) {
          return ApiException.notFound(message: message, data: data['data']);
        }
        return ApiException.notFound();
      });
    }

    if (code == 500) {
      final error = JsonHelper.decodeStatusMessageError(res);
      if (error != null) throw error;
    }

    throw ApiException.from(res);
  }

  Future<Order> updateOrder(String orderId, Order order) async {
    if (orderId == null) throw ArgumentError.notNull('orderId');
    if (order == null) throw ArgumentError.notNull('order');

    var orderData = order.toMap();
    if (orderData == null) throw ArgumentError.notNull('order');

    final res = await httpService.put('/orders/$orderId', body: JsonHelper.encode(orderData));
    final code = res.statusCode;

    if (code == 200) {
      return Order.fromJson(res.body);
    }

    if (code == 404) {
      throw ApiException.notFound(message: 'Order not found');
    }

    if (code == 500) {
      final error = JsonHelper.decodeStatusMessageError(res);
      if (error != null) throw error;
    }

    throw ApiException.from(res);
  }

  Future<Order> cancelOrder(String orderId) async {
    if (orderId == null) throw ArgumentError.notNull('orderId');

    final res = await httpService.delete('/orders/$orderId');
    final code = res.statusCode;

    if (code == 200) {
      return Order.fromJson(res.body);
    }

    if (code == 404) {
      throw ApiException.notFound(message: 'Order not found');
    }

    if (code == 500) {
      final error = JsonHelper.decodeStatusMessageError(res);
      if (error != null) throw error;
    }

    throw ApiException.from(res);
  }

  Future<InvoicePaymentResult> payOrder(String orderId) async {
    if (orderId == null) throw ArgumentError.notNull('orderId');

    final res = await httpService.put('/orders/pay/$orderId');
    final code = res.statusCode;

    if (code == 200) {
      return InvoicePaymentResult.fromJson(res.body);
    }

    if (code == 404) {
      throw ApiException.notFound(message: 'Order not found');
    }

    if (code == 500) {
      final error = JsonHelper.decodeStatusMessageError(res);
      if (error != null) throw error;
    }

    throw ApiException.from(res);
  }

  // Get & refresh order warnings
  Future<List<OrderWarningResult>> getOrderWarnings(String orderId) async {
    if (orderId == null) throw ArgumentError.notNull('orderId');

    final res = await httpService.put('/orders/pay/$orderId');
    final code = res.statusCode;

    if (code == 200) {
      return OrderWarningResult.listFromJson(res.body);
    }

    if (code == 404) {
      throw ApiException.notFound(message: 'Order not found');
    }

    if (code == 500) {
      final error = JsonHelper.decodeStatusMessageError(res);
      if (error != null) throw error;
    }

    throw ApiException.from(res);
  }
}
