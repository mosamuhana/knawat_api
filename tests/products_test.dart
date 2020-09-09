import '../lib/src/services/knawat.service.dart';

class ProductsTest {
  final KnawatService service;

  ProductsTest(this.service);

  Future<void> getCategories() async {
    var categories = await service.categories.getCategories(treeNodeLevel: 4);
    print('count: ${categories.total}');
    print(categories.items);
  }
}
