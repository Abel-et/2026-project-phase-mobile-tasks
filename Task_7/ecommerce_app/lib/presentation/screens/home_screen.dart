import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/commerce_service.dart';
import '../widget/product_card.dart';
import './add_product_screen.dart';
import './edit_product_screen.dart';

class HomeScreen extends StatefulWidget {
  final CommerceService service;
  
  const HomeScreen({super.key, required this.service});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A2SV Store'),
      ),
      body: ListView.builder(
        itemCount: widget.service.products.length,
        itemBuilder: (context, index) {
          final product = widget.service.products[index];
          return ProductCard(
            product: product,
            onDelete: () {
              widget.service.deleteProduct(index);
              setState(() {});
            },
            onEdit: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProductScreen( // Fixed typo 'contex' -> 'context'
                    service: widget.service,
                    index: index,
                  ),
                ),
              );
              setState(() {});
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) async {
          setState(() {
            currentIndex = index;
          });
          
          if (index == 1) {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddProductScreen(
                  service: widget.service, // Fixed: Changed 'commerceService' to 'widget.service'
                ),
              ),
            );
            
            // Reset index back to Home tab when returning
            setState(() {
              currentIndex = 0;
            });
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart_rounded, color: Colors.greenAccent),
            label: 'Add Product',
          )
        ],
      ),
    );
  }
}
