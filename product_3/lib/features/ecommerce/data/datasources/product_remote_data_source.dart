import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  // calls the http://ecommerce-api.com/products endpoint
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> createProduct(ProductModel product);
    Future<ProductModel> getProduct(int id);

  Future<ProductModel> updateProduct(ProductModel product);
  Future<void> deleteProduct(int id);
  }