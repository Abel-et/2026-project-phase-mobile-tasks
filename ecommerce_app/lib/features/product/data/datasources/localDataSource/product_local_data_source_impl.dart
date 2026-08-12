import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/product_model.dart';
import 'product_local_data_source.dart';


class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final SharedPreferences sharedPreferences;

  ProductLocalDataSourceImpl({ required this.sharedPreferences});

  static const String cachedProductKey = 'CACHED_PRODUCTS';


// the objective of this method is there is store product in sharedPreferences 
// the this method will  fetch the data and return to product model 
//
  @override
  Future<List<ProductModel>> getLastProducts() async{
    // get data from sharedPreferences that are stored before  as a json string format 
    final jsonString = 
    sharedPreferences.getString(cachedProductKey);

    if(jsonString != null){
    //  convert the give json string of data to list map of <string and dynamic> like a product model
      final List<dynamic> jsonList = jsonDecode(jsonString);

      // finally returned it as a json list the is suitable for product model 
      return jsonList
      .map(
        (json) => ProductModel.fromJson(
          json as Map<String, dynamic>,
        ),
      ).toList();
    }
    return [];
  }

  @override
  Future <void> cacheProducts(
    List<ProductModel> productsToCache,) async{
      final jsonList = productsToCache
      .map((product)=> product.toJson())
      .toList();
      final jsonString  =  jsonEncode(jsonList);

      await sharedPreferences.setString(
        cachedProductKey,
        jsonString,
      );
    }
  
}