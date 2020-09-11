import '../exceptions.dart';
import '../helpers.dart';
import '../internals.dart';
import '../models.dart';
import '../params.dart';
import '../results.dart';
import '../constants.dart';
import 'http.service.dart';

class MyProductsService {
  final HttpService httpService;

  MyProductsService(this.httpService);

  Future<PagedResult<Product>> getProducts(GetProductsParams params) async {
    var query = QueryParams.fromMap(params?.toMap())?.toMap();
    final res = await httpService.get('/catalog/products', query: query);
    final code = res.statusCode;

    if (code == 200) {
      //print(res.body);
      return PagedResult.from(res, itemsKey: 'products', mapFn: (v) => Product.fromMap(v));
    }

    throw ApiException.from(res);
  }

  Future<Product> getProduct(String sku, {String currency}) async {
    var query = QueryParams.fromMap({'currency': currency})?.toMap();

    final res = await httpService.get('/catalog/products/$sku', query: query);
    final code = res.statusCode;

    if (code == 200) {
      return JsonHelper.decodeMapResponse<Product>(res, 'product', (item) => Product.fromMap(item));
    }

    if (code == 404) {
      var message = JsonHelper.decodeErrors(res);
      if (message != null) {
        throw ApiException.notFound(message: message);
      }
    }

    throw ApiException.from(res);
  }

  Future<bool> deleteProduct(String sku) async {
    final res = await httpService.delete('/catalog/products/$sku');
    final code = res.statusCode;

    if (code == 200) {
      /*
      Delete Product Result (code == 200)
      {
          "product": {
              "status": "success",
              "message": "Product has been deleted.",
              "sku": "A2KT18A82307-2213"
          }
      }
      */
      JsonHelper.tryDecode(
        res,
        orElse: () => false,
        map: (data) {
          final product = data['product'] as Map<String, dynamic>;
          return product['status'] == SUCCESS && product['sku'] == sku;
        },
      );

      return true;
    }

    if (code == 500) {
      final error = JsonHelper.decodeStatusMessageError(res);
      if (error != null) throw error;
    }

    throw ApiException.from(res);
  }

  Future<bool> updateProduct(String sku, {UpdateProductParams params}) async {
    final res = await httpService.put('/catalog/products/$sku', body: params?.toJson());
    final code = res.statusCode;

    if (code == 200) return true;

    if (code == 404) {
      throw ApiException.notFound(message: 'Product not found');
    }

    if (code == 500) {
      final error = JsonHelper.decodeStatusMessageError(res);
      if (error != null) throw error;
    }

    throw ApiException.from(res);
  }

  Future<AddProductsResult> addProducts(List<String> skuList) async {
    final payload = <String, dynamic>{
      'products': skuList.map((sku) => <String, String>{'sku': sku}).toList()
    };

    final res = await httpService.post('/catalog/products', body: JsonHelper.encode(payload));
    final code = res.statusCode;

    if (code == 200) {
      return AddProductsResult.fromJson(res.body);
    }

    if (code == 500) {
      final error = JsonHelper.decodeStatusMessageError(res);
      if (error != null) throw error;
    }

    throw ApiException.from(res);
  }

  Future<bool> bulkUpdateProducts(List<BulkUpdateProductParams> items) async {
    final res = await httpService.patch('/catalog/products', body: BulkUpdateProductParams.listToJson(items));
    final code = res.statusCode;

    if (code == 200) return true;

    if (code == 500) {
      final error = JsonHelper.decodeStatusMessageError(res);
      if (error != null) throw error;
    }

    throw ApiException.from(res);
  }

  Future<int> productsCount() async {
    final res = await httpService.get('/catalog/products/count');
    final code = res.statusCode;

    if (code == 200) {
      return JsonHelper.tryDecode<int>(res, map: (data) => data['total']?.toInt());
    }

    if (code == 500) {
      final error = JsonHelper.decodeStatusMessageError(res);
      if (error != null) throw error;
    }

    throw ApiException.from(res);
  }

  Future<List<String>> searchProducts(SearchProductsParams params) async {
    final res = await httpService.post('/catalog/products/search', body: params?.toJson());
    final code = res.statusCode;

    if (code == 200) {
      return JsonHelper.tryDecode<List<String>>(
        res,
        map: (data) => (data as List<dynamic>).map<String>((item) => item['sku']).toList(),
      );
    }

    if (code == 500) {
      final error = JsonHelper.decodeStatusMessageError(res);
      if (error != null) throw error;
    }

    throw ApiException.from(res);
  }
}
