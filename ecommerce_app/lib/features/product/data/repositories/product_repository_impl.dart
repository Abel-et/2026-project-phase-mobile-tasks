import '../../../../core/network/network_info.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/local/product_local_data_source.dart';
import '../datasources/remote/product_remote_data_source.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl  implements ProductRepository{
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo
  });
  
  // thi class will implements all method that are declared in abstract class in repository(domain)file
  @override
  Future<List<Product>> getAllProducts() async{
    if( await networkInfo.isConnected){
      try{
        final remoteProduct = await remoteDataSource.getAllProducts();
        await localDataSource.cacheProducts(remoteProduct);
        return remoteProduct;
      }catch(e){
        // fallback to local cache if remote request fails
        return await localDataSource.getLastProducts();

      }
    }else{
      // offline 
      return await localDataSource.getLastProducts();
    }
  }

  @override
  Future<Product> getProduct(String id) async {
    if( await networkInfo.isConnected){
      return await remoteDataSource.getProduct(id);}
      else{
        throw UnimplementedError('offline handling for single product is not implemented');
      }
    
  }

  // @override
  Future<void> createProduct(Product product) async{
    if(await networkInfo.isConnected){
      final productModel = ProductModel(
        id: product.id,
        name: product.name,
        description: product.description,
        imageUrl: product.imageUrl,
        price: product.price,
      );

      await remoteDataSource.createProduct(productModel);
    }else{
      throw Exception(
        'cannot create product while offline.',
      );
    }
  }

  @override
  Future <void> updateProduct(Product product)async{
     if(await networkInfo.isConnected){
      final productModel = ProductModel(
        id: product.id,
        name: product.name,
        description: product.description,
        imageUrl: product.imageUrl,
        price: product.price,
      );

      await remoteDataSource.updateProduct(productModel);
    }else{
      throw Exception(
        'cannot update product while offline.',
      );
    } 
  }

  @override
  Future <void> deleteProduct(String id ) async{
    if (await networkInfo.isConnected){
      await remoteDataSource.deleteProduct(id);
    }else{
      throw Exception(
        'cannot delete product while offline.'
      );
    }
  }
}