class Product {
  String name;
  String category;
  String price;
  int quantity;

  Product({
    required this.name,
    required this.category,
    required this.price,
    required this.quantity,
  });

  @override
  String toString(){
    return 'product $name, $category , $price ETB,  $quantity';
  }
}