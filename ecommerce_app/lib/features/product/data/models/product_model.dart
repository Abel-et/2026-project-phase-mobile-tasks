
import '../../domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.description,
    required super.name ,
     required super.imageUrl,
     required super.price
  });

// factory constructor to convert json => productModels
  factory ProductModel.fromJson(Map <String ,dynamic>json){
    return ProductModel(
       id: json['id'], 
    description: json['description'], 
    name: json['name'], 
    imageUrl: json['imageUrl'],
     price: json['price']);
  }
  Map<String, dynamic>toJson(){
    return {
      'id': id,
      'name' : name,
      'description':description,
      'imageUrl': imageUrl,
      'price': price

    };
  }

}