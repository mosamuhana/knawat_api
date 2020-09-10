import '../exceptions.dart';
import '../helpers.dart';
import '../internals/query_params.dart';
import '../models.dart';
import 'http.service.dart';

class WebhookService {
  final HttpService httpService;

  WebhookService(this.httpService);

  Future<PagedResult<Webhook>> getAll({String storeId, int page, int pageSize}) async {
    var query = QueryParams.fromMap({
      'storeId': storeId,
      'page': page,
      'pageSize': pageSize,
    })?.toMap();

    final res = await httpService.get('/webhooks', query: query);
    final code = res.statusCode;

    if (code == 200) {
      return PagedResult.from(
        res,
        totalKey: 'total',
        itemsKey: 'rows',
        mapFn: (item) => Webhook.fromMap(item),
      );
    }

    throw ApiException.from(res);
  }

  Future<Webhook> register({String storeId, String url, String topic}) async {
    if (url == null) ArgumentError.notNull('url');
    if (topic == null) ArgumentError.notNull('topic');

    var bodyData = MapHelper.filterNulls<String, dynamic>({
      'storeId': storeId,
      'url': url,
      // TODO: convert topic to enum
      'topic': topic,
    });

    String body = bodyData == null ? null : JsonHelper.encode(bodyData);

    final res = await httpService.post('/webhooks', body: body);
    final code = res.statusCode;

    if (code == 200) {
      return Webhook.fromJson(res.body);
    }

    throw ApiException.from(res);
  }

  Future<Webhook> unregister(String webhookId) async {
    if (webhookId == null) ArgumentError.notNull('webhookId');

    final res = await httpService.delete('/webhooks/$webhookId');
    final code = res.statusCode;

    if (code == 200) {
      return Webhook.fromJson(res.body);
    }

    if (code == 404) {
      throw ApiException.notFound(message: 'Webhook not found');
    }

    throw ApiException.from(res);
  }
}
