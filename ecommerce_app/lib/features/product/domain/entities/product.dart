
// In eCommerce the Product is one of the Actor
class Product {
  final int id;
  final String name;
  final String description ;
  final String imageUrl ;
  final double price ;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price
  });
}