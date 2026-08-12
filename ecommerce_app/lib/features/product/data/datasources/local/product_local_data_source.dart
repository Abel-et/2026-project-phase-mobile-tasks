import '../../models/product_model.dart';

// a Contract for managing cached data on the local device storage
abstract class ProductLocalDataSource {
  // fetch the last cached list of products.
  Future<List<ProductModel>> getLastProducts();
  Future<void> cacheProducts(List<ProductModel> productsToCache);

}