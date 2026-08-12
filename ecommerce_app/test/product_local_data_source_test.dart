import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ecommerce_clean_architecture/features/product/data/datasources/local/product_local_data_source_impl.dart';
import 'package:ecommerce_clean_architecture/features/product/data/models/product_model.dart';


void main(){
  late SharedPreferences sharedPreferences;
  late ProductLocalDataSourceImpl localDataSource;

   final testProduct = ProductModel(
    id: '1',
    description: 'description',
    name: 'name',
    imageUrl: 'imageUrl',
    price: 300.0,
  );
  final testProducts = [testProduct];
  setUp(() async{
    SharedPreferences.setMockInitialValues({});
    sharedPreferences = await SharedPreferences.getInstance();
    localDataSource = ProductLocalDataSourceImpl(sharedPreferences: sharedPreferences);

  });
  test(
    'Should cache products in SharedPreference', () async{
      await localDataSource.cacheProducts(testProducts);

      final cachedData = sharedPreferences.getString('CACHED_PRODUCTS',);
      expect(cachedData,isNotNull);
    }
  );
  // test two 
  test(
    'should return cached products from SharedPreferences ',() async{
      await localDataSource.cacheProducts( testProducts,);
      final result = await localDataSource.getLastProducts();
      expect(result, testProducts);
    });
    // test 3
    test(
      'should return empty list when no products are in cached'
, () async{
  final result = await localDataSource.getLastProducts();
  expect(result, isEmpty);
}    );
  }