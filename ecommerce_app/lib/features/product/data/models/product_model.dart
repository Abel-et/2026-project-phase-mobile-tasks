import '../../domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.description,
    required super.name,
    required super.imageUrl,
    required super.price,
  });

  // factory constructor to convert json => productModels
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      description: json['description'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      price: (json['price'] as num).toDouble(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
    };
  }

  @override
  bool operator ==(Object other){
    if (identical(this,other )) return true;

    return other is ProductModel &&
    other.id == id &&
    other.name == name &&
    other.description == description &&
    other.imageUrl == imageUrl &&
    other.price == price;
  }

  @override 
  int get hashCode{
    return Object.hash(id,description,name,price, imageUrl);
  }
}
