import '../exceptions.dart';
import '../helpers.dart';
import '../internals.dart';
import '../models.dart';
import '../params.dart';
import '../results.dart';
import 'http.service.dart';

class InvoiceService {
  final HttpService httpService;

  InvoiceService(this.httpService);

  Future<PagedResult<Invoice>> getInvoices([ListInvoicesParams params]) async {
    var query = QueryParams.fromMap(params?.toMap())?.toMap();
    final res = await httpService.get('/invoices', query: query);

    if (res.statusCode != 200) throw ApiException.from(res);

    var result = PagedResult.from(
      res,
      // TODO: Not clear for count
      totalKey: 'count',
      itemsKey: 'invoices',
      mapFn: (item) => Invoice.fromMap(item),
    );

    return result;
  }

  Future<InvoicePaymentResult> applyCredits(String invoiceId, {bool useSavedPaymentMethods, double paymentAmount}) async {
    var bodyData = MapHelper.filterNulls<String, dynamic>({
      'useSavedPaymentMethods': useSavedPaymentMethods,
      'paymentAmount': paymentAmount,
    });
    String body = bodyData == null ? null : JsonHelper.encode(bodyData);

    final res = await httpService.post('/invoices/${invoiceId}/credits', body: body);
    final code = res.statusCode;

    if (code == 200) {
      return InvoicePaymentResult.fromJson(res.body);
    }

    if (code == 500) {
      final error = JsonHelper.decodeStatusMessageError(res);
      if (error != null) throw error;
    }

    throw ApiException.from(res);
  }
}
