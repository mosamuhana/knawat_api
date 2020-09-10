import '../exceptions.dart';
import '../internals.dart';
import '../models.dart';
import '../results.dart';
import '../params.dart';
import 'http.service.dart';

// PaymentResult  ListPaymentsParams
class PaymentService {
  final HttpService httpService;

  PaymentService(this.httpService);

  Future<PagedResult<PaymentResult>> getAll([ListPaymentsParams params]) async {
    var query = QueryParams.fromMap(params?.toMap())?.toMap();
    final res = await httpService.get('/payments', query: query);

    if (res.statusCode != 200) throw ApiException.from(res);

    var result = PagedResult.from(
      res,
      // TODO: Not clear for count
      totalKey: 'count',
      itemsKey: 'payments',
      mapFn: (item) => PaymentResult.fromMap(item),
    );

    return result;
  }
}
