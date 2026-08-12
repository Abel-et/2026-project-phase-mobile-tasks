import '../../features/product/data/datasources/product_remote_data_source.dart';
import '../../features/product/data/models/product_model.dart';
class FailingRemoteDataSource
    implements ProductRemoteDataSource {

  @override
  Future<List<ProductModel>> getAllProducts() async {
    throw Exception('Server error');
  }

  @override
  Future<ProductModel> getProduct(int id) async {
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
  Future<void> deleteProduct(int id) async {
    throw Exception('Server error');
  }
}