import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../../core/constants/api_constants.dart';
import '../../../../../core/error/exception.dart';
import '../../models/product_model.dart';
import 'product_remote_data_source.dart';

class ProductRemoteDataSourceImpl 
  implements ProductRemoteDataSource{
   final http.Client  client;
    ProductRemoteDataSourceImpl({
      required this.client
    });

// get all products from http api
    @override
    Future<List<ProductModel>> getAllProducts() async{
      // get response form  internet 
      final response = await client.get( 
        Uri.parse('${ApiConstants.baseUrl}/products'),
      );
      // check the status code
      if(response.statusCode == 200){
        // convert in json data the coming response
        final jsonData = jsonDecode(response.body);
        // using map convert the jsonData to product Model form json to model
        return(jsonData as List)
        .map((json)=> ProductModel.fromJson(
          json as Map<String,dynamic>,
        )).toList();
      }else{
        throw ServerException();
      }
    }

// get single product from api using it id
    @override
    Future<ProductModel> getProduct(String id ) async{
      final response = await client.get( 
        Uri.parse('${ApiConstants.baseUrl}/products/$id'),
      );

      if(response.statusCode == 200){
        final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
        final product = jsonData['data'] as Map<String ,dynamic>;
        return ProductModel.fromJson(product);
      }else{
        throw ServerException();
      }
    }

// update product on api or remote source
    @override
    Future<ProductModel> updateProduct(ProductModel product) async{
      final response = await client.put( 
        Uri.parse('${ApiConstants.baseUrl}/products/${product.id}'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(product.toJson()),
      );
      if(response.statusCode == 200){
        final jsonData = jsonDecode(response.body) as Map<String , dynamic >;
        final updatedProduct = jsonData['data'] as Map<String , dynamic>;
        return ProductModel.fromJson(updatedProduct);
      } else{
        throw ServerException();
      }
    }

// create product 
    @override
    Future<ProductModel> createProduct(ProductModel product) async{
      final response = await client.post( 
        Uri.parse('${ApiConstants.baseUrl}/products'),
      
      headers:{
        'Content-Type' :'application/json',
      },
      body: jsonEncode(product.toJson()),
      );

      if(response.statusCode == 201){
        final jsonData = jsonDecode( response.body) as Map<String, dynamic>;
        final createdProduct = jsonData['data'] as Map<String , dynamic>;
        return ProductModel.fromJson(createdProduct);
      }else{
        throw ServerException();
      }
    }
// remove product
    @override
    Future<void> deleteProduct(String id )  async{
      final response = await client.delete(
        Uri.parse('${ApiConstants.baseUrl}/products/{id}')
      );
      if (response.statusCode != 200 && response.statusCode != 204){
        throw ServerException();
      }
    }
  }