import '../exceptions.dart';
import '../helpers.dart';
import '../internals.dart';
import '../models.dart';
import 'http.service.dart';

class CategoryService {
  final HttpService httpService;

  CategoryService(this.httpService);

  Future<List<Category>> getAll([int parentId, int treeNodeLevel]) async {
    var query = QueryParams.from({
      'parentId': parentId,
      'treeNodeLevel': treeNodeLevel,
    }).toMap();

    final res = await httpService.get('/catalog/categories', query: query);

    if (res.statusCode != 200) throw ApiException.from(res);

    return JsonHelper.decodeListResponse(res, 'categories', (v) => Category.fromMap(v));
  }
}
