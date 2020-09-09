import '../helpers.dart';
import '../results.dart';
import '../constants.dart';
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
    final res = await httpService.get('/catalog/products', query: query);
    final code = res.statusCode;

    if (code == 200) {
      return ListHelper.fromMap(JsonHelper.decode(res.body), map: (item) => OrderResult.fromMap(item));
    }

    throw ApiException.from(res);
  }

  Future<List<OrderResult>> createOrder({CreateOrderParams params}) async {
    var body = JsonHelper.encode(params?.toMap());
    final res = await httpService.post('/catalog/products', body: body);
    final code = res.statusCode;

    if (code == 200) {
      //return ListHelper.fromMap(JsonHelper.decode(res.body), map: (item) => OrderResult.fromMap(item));
    }

    throw ApiException.from(res);
  }
}
