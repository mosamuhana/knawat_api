import '../json.dart';
import '../models.dart';
import 'http.service.dart';

class CategoryService {
  final HttpService httpService;

  CategoryService(this.httpService);

  Future<List<Category>> getAll([int parentId, int treeNodeLevel]) async {
    Map<String, String> query;
    if (parentId != null || treeNodeLevel != null) {
      query = {
        if (parentId != null) 'parentId': '$parentId',
        if (treeNodeLevel != null) 'treeNodeLevel': '$treeNodeLevel',
      };
    }

    final res = await httpService.get('/catalog/categories', query: query, auth: AuthType.jwt);

    if (res.statusCode != 200) throw httpService.getError(res);

    return Json.decodeResponse<List<dynamic>, List<Category>>(
      res,
      selector: (d) => d['categories'] as List<dynamic>,
      map: (list) => list.map((map) => Category.fromMap(map)).toList(),
    );
  }
}
