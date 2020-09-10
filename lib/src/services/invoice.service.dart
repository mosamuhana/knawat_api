import '../exceptions.dart';
import '../internals.dart';
import '../models.dart';
import 'http.service.dart';

class InvoiceService {
  final HttpService httpService;

  InvoiceService(this.httpService);

  Future<PagedResult<Category>> getCategories({int parentId, int treeNodeLevel}) async {
    var query = QueryParams.fromMap({
      'parentId': parentId,
      'treeNodeLevel': treeNodeLevel,
    }).toMap();

    final res = await httpService.get('/catalog/categories', query: query);

    if (res.statusCode != 200) throw ApiException.from(res);

    return PagedResult.from(
      res,
      totalKey: 'count',
      itemsKey: 'categories',
      mapFn: (item) => Category.fromMap(item),
    );
  }
}
