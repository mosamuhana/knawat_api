import 'dart:convert';

import '../models.dart';
import 'http.service.dart';

class MyProductsService {
  final HttpService httpService;

  MyProductsService(this.httpService);

  void getProduct(String sku, {String currency}) {}

  /*
  Future<List<Category>> getAll([int parentId, int treeNodeLevel]) async {
    Map<String, String> query;
    if (parentId != null || treeNodeLevel != null) {
      query = {
        if (parentId != null) 'parentId': '$parentId',
        if (treeNodeLevel != null) 'treeNodeLevel': '$treeNodeLevel',
      };
    }

    final res = await httpService.get('/catalog/categories', query: query);

    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      List<dynamic> list = data['categories'];
      return list.map((map) => Category.fromMap(map)).toList();
    }

    throw httpService.getError(res);
  }
  */
}
