import '../entities/product.dart';
import '../repositories/productRepository.dart';


class GetProduct {
  final ProductRepository repository;

  GetProduct(this.repository);

  Future<Product> call(int id) async{
    return await repository.getProduct(id);
  }


}