import '../../../../core/network/network_info.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_local_data_source.dart';
import '../datasources/product_remote_data_source.dart';

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
        await localDataSource.cacheProduct(remoteProduct);
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
  Future<Product> getProduct(int id) async {
    if( await networkInfo.isConnected){
      return await remoteDataSource.getProduct(id);}
      else{
        throw UnimplementedError('offline handling for single product is not implemented');
      }
    
  }

  @override
  Future<void> createProduct(Product product) async{
    // there is no a method that convert the in coming product to model form 
  }

  @override
  Future <void> updateProduct(Product product)async{
    // similar to create 
  }

  @override
  Future <void> deleteProduct(int id ) async{
    if (await networkInfo.isConnected){
      await remoteDataSource.deleteProduct(id);
    }
  }
}