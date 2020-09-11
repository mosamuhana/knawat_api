import '../lib/src/params/get_products_params.dart';
import '../lib/src/services/knawat.service.dart';

class MyProductsTest {
  final KnawatService service;

  MyProductsTest(this.service);

  Future<void> getProducts() async {
    var params = GetProductsParams(hideOutOfStock: false);
    var products = await service.myProducts.getProducts(params);
    print('count: ${products.total}');
    print(products.items);
  }

  Future<void> getProduct() async {
    try {
      var product = await service.myProducts.getProduct('BD5078BGD19_011');
      print(product.json);
    } catch (e) {
      print('Error Type: ${e.runtimeType}');
      print('Error: $e');
    }
  }
}
