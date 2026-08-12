import '../../features/product/data/datasources/remote/product_remote_data_source.dart';
import '../../features/product/data/models/product_model.dart';
class FailingRemoteDataSource
    implements ProductRemoteDataSource {

  @override
  Future<List<ProductModel>> getAllProducts() async {
    throw Exception('Server error');
  }

  @override
  Future<ProductModel> getProduct(String id) async {
    throw Exception('Server error');
  }

  @override
  Future<ProductModel> createProduct(
    ProductModel product,
  ) async {
    throw Exception('Server error');
  }

  @override
  Future<ProductModel> updateProduct(
    ProductModel product,
  ) async {
    throw Exception('Server error');
  }

  @override
  Future<void> deleteProduct(String id) async {
    throw Exception('Server error');
  }
}