import '../lib/src/params/get_products_params.dart';
import '../lib/src/services/knawat.service.dart';

class MyProductsTest {
  final KnawatService service;

  MyProductsTest(this.service);

  Future<void> getProducts() async {
    var params = GetProductsParams(hideOutOfStock: false);
    var products = await service.myProducts.getProducts(params: params);
    print('count: ${products.total}');
    print(products.items);
  }

  Future<void> getProduct() async {
    try {
      var product = await service.myProducts.getProduct('TETTSTM-T36281');
      print(product);
    } catch (e) {
      print('Error Type: ${e.runtimeType}');
      print('Error: $e');
    }
  }
}
