import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/commerce_service.dart';

class AddProductScreen extends StatefulWidget {
  final CommerceService service;
  const AddProductScreen({
    super.key,
    required this.service,
    });

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final priceController = TextEditingController();
  final quantityController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product '),
      ),

      body: Padding(
        padding: const EdgeInsets.all(46),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Product Name',
                border: OutlineInputBorder(),
              ) ,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: categoryController,
              decoration: const InputDecoration(
                labelText: ' Category',
                border: OutlineInputBorder(),
              ) ,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(
                labelText: ' Price',
                border: OutlineInputBorder(),
              ) ,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: quantityController,
              decoration: const InputDecoration(
                labelText: ' Quantity',
                border: OutlineInputBorder(),
              ) ,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){
                final product = Product(
                  name: nameController.text,
                  category: categoryController.text,
                  price: priceController.text,
                  quantity: int.parse(quantityController.text),
                );
                
                widget.service.addProduct(product);
                Navigator.pop(context);
              },
               child: const Text("Add Product "),
               )
          ],),
        ),
    );
  }
}




