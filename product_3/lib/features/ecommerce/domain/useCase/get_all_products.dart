import '../repositories/productRepository.dart';
import '../entities/product.dart';

class GetAllProducts {
  final ProductRepository repository ;

  GetAllProducts(this.repository);

  Future<List<Product>> call() async{
    return await repository.getAllProducts();
  }
}