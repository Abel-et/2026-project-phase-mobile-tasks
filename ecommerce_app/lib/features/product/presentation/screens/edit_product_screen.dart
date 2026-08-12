import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/commerce_service.dart';

class EditProductScreen extends StatefulWidget {
  final CommerceService service ;
   final int index ;
  const EditProductScreen({
    super.key,
    required this.service,
    required this.index
    });

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  late Product product;
  late TextEditingController nameController;
  late TextEditingController categoryController;
  late TextEditingController priceController;
  late TextEditingController quantityController;

  @override
  void initState(){
    super.initState();
    product = widget.service.getProduct(widget.index);
    nameController = TextEditingController(
      text: product.name
    );
    categoryController = TextEditingController(
      text: product.category
    );
      priceController = TextEditingController(
      text: product.price
    );
    quantityController = TextEditingController(
      text: product.quantity.toString()
    );
  }
  
  @override
  void dispose(){
    nameController.dispose();
    categoryController.dispose();
    quantityController.dispose();
    priceController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Product'),),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Product Name',
              border: OutlineInputBorder()
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            controller: categoryController,
            decoration: const InputDecoration(
              labelText: 'Category',
              border: OutlineInputBorder()
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            controller: priceController,
            decoration: const InputDecoration(
              labelText: 'Price',
              border: OutlineInputBorder()
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            controller: quantityController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Quantity',
              border: OutlineInputBorder()
            ),
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
             final product = Product(
                  name: nameController.text,
                  category: categoryController.text,
                  price: priceController.text,
                  quantity: int.parse(quantityController.text),
                );
                widget.service.updateProduct(widget.index, product);
      
                Navigator.pop(context);
          }, child: Text("Update Product"))
        ],)
        ),
    );
  }
}