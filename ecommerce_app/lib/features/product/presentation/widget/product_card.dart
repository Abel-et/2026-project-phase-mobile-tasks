
import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  const ProductCard({
    super.key,
    required this.product,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
          Center(
            child: Text(
              product.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
            

            const SizedBox(height: 8),

            Text(
              'Category: ${product.category}',
              style: const TextStyle(
                fontSize: 16,
              
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Price: ${product.price}',
            ),

            const SizedBox(height: 8),

            Text(
              'Quantity: ${product.quantity}',
            ),
            const SizedBox(height: 0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed:onEdit, 
                  icon: Icon(Icons.edit , color: 
                  const Color.fromARGB(255, 80, 223, 13),
                 )),

                  IconButton(onPressed: onDelete, 
                  icon:  Icon( Icons.delete, color: Colors.red),),
              ],
            )
          ],
        ),
      ),
    );
  }
}