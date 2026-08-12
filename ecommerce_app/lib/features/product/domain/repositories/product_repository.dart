import '../entities/product.dart';

abstract class ProductRepository {
  // a method to fetch all products
  Future <List<Product>> getAllProducts();

  //  a method to fetch a single product
  Future<Product> getProduct(String id);

  // to Edit Product
  Future<void> updateProduct(Product product);

  // to delete Product 
  Future<void> deleteProduct(String id);
}