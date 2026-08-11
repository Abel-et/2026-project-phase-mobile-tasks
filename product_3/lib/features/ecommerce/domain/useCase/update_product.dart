import '../entities/product.dart';
import '../repositories/productRepository.dart';

class UpdateProduct {
  final ProductRepository repository;

  UpdateProduct(this.repository);

  Future<void> call(Product product) async{
     return await repository.updateProduct(product);
}
}