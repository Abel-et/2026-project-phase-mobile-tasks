import 'package:flutter_test/flutter_test.dart';

import '../core/network/network_info.dart';
import '../features/product/data/datasources/product_local_data_source.dart';
import '../features/product/data/datasources/product_remote_data_source.dart';
import '../features/product/data/models/product_model.dart';
import '../features/product/data/repositories/product_repository_impl.dart';
class FakeNetworkInfo implements NetworkInfo{
  final bool connected;

  FakeNetworkInfo(this.connected);

  @override
  Future<bool> get isConnected async => connected;
}


class FakeRemoteDataSource implements ProductRemoteDataSource {
  final List<ProductModel> products;

  FakeRemoteDataSource(this.products);

  @override
  Future<List<ProductModel>> getAllProducts() async {
    return products;
  }

  @override
  Future<ProductModel> getProduct(int id) async {
    return products.firstWhere(
      (product) => product.id == id,
    );
  }

  @override
  Future<ProductModel> createProduct(
    ProductModel product,
  ) async {
    products.add(product);
    return product;
  }

  @override
  Future<ProductModel> updateProduct(
    ProductModel product,
  ) async {
    final index = products.indexWhere(
      (item) => item.id == product.id,
    );

    if (index == -1) {
      throw Exception('Product not found');
    }

    products[index] = product;

    return product;
  }

  @override
  Future<void> deleteProduct(int id) async {
    products.removeWhere(
      (product) => product.id == id,
    );
  }
}



class FakeLocalDataSource implements ProductLocalDataSource {
  final List<ProductModel> cachedProduct;

  FakeLocalDataSource(this.cachedProduct);

  @override
  Future<List<ProductModel>> getLastProducts() async {
    return cachedProduct;
  }

  @override
  Future<void> cacheProducts(
    List<ProductModel> productsToCache,
  ) async {
    cachedProduct
      ..clear()
      ..addAll(productsToCache);
  }
}

final testProduct = ProductModel( 
  id:1,
  description: 'description',
  name:'name',
  imageUrl: 'imageurl',
  price: 300.0,
);

final testProducts = [ testProduct ];








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
void main(){
test(
  'should return cached products when remote data source fails',
  () async {
    final remoteDataSource =
        FailingRemoteDataSource();

    final localDataSource =
        FakeLocalDataSource(testProducts);

    final networkInfo =
        FakeNetworkInfo(true);

    final repository = ProductRepositoryImpl(
      remoteDataSource: remoteDataSource,
      localDataSource: localDataSource,
      networkInfo: networkInfo,
    );

    final result =
        await repository.getAllProducts();

    expect(result, testProducts);
  },
);
test(
  'should cache products when remote data is successfully retrieved',
  () async {
    final remoteDataSource =
        FakeRemoteDataSource(testProducts);

    final localDataSource =
        FakeLocalDataSource([]);

    final networkInfo =
        FakeNetworkInfo(true);

    final repository = ProductRepositoryImpl(
      remoteDataSource: remoteDataSource,
      localDataSource: localDataSource,
      networkInfo: networkInfo,
    );

    await repository.getAllProducts();

    expect(
      localDataSource.cachedProduct,
      testProducts,
    );
  },
);

test(
  'should get products from local data source when offline',
  () async {
    final remoteDataSource =
        FakeRemoteDataSource([]);

    final localDataSource =
        FakeLocalDataSource(testProducts);

    final networkInfo =
        FakeNetworkInfo(false);

    final repository = ProductRepositoryImpl(
      remoteDataSource: remoteDataSource,
      localDataSource: localDataSource,
      networkInfo: networkInfo,
    );

    final result =
        await repository.getAllProducts();

    expect(result, testProducts);
  },
);
test(
  'should get products from remote data source when online',
  () async{
    final remoteDataSource = FakeRemoteDataSource(testProducts);

    final localDataSource = FakeLocalDataSource([]);
    final networkInfo = FakeNetworkInfo(true);
      final repository = ProductRepositoryImpl(
      remoteDataSource: remoteDataSource,
      localDataSource: localDataSource,
      networkInfo: networkInfo,
    );

    final result =
        await repository.getAllProducts();

    expect(result, testProducts);

  },
);
}