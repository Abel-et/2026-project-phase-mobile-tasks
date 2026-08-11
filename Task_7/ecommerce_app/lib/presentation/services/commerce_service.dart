import '../models/product.dart';

class CommerceService {
  final List <Product> products = [];

  // Adding product into Product list 
  void addProduct(Product product){
    products.add(product);
      }

  //  deleting product using it index
  void deleteProduct( int index){
    products.removeAt(index);
  }

  void updateProduct(int index , Product updatedProduct){
    products[index] = updatedProduct;
  }

  Product getProduct(int index){
    return products[index];
  }
} 