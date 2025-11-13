import 'package:flutter/material.dart';

enum Product {
  dart(
    'Dart',
    'the best object languages.',
    'assets/ex3/dart.png',
  ),
  flutter(
    'Flutter',
    'the best mobile widget library..',
    'assets/ex3/flutter.png',
  ),
  firebase(
    'Firebase',
    'the best cloud database.',
    'assets/ex3/firebase.png',
 );

  final String title;
  final String description;
  final String image;

  const Product(this.title, this.description, this.image);
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
      margin: const EdgeInsets.only(bottom: 15),
      child: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Image.asset(
         product.image,
         height: 50,
        ),
          const SizedBox(height: 8),
          Text(
             product.title,
             style: const TextStyle(
             fontSize: 20,
             fontWeight: FontWeight.bold,
            ),
       ),
          const SizedBox(height: 8),
           Text(product.description),
          ],
         ),
     ),
    );
   }
}

void main() {
   runApp(
      MaterialApp(
      home: Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
      title: const Text('Product'),
      backgroundColor: Colors.grey[100],
    ),
      body: Column( 
      children: [
      Expanded( 
      child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.builder( 
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  itemCount: Product.values.length,
                  itemBuilder: (context, index) {
                  return ProductCard(product: Product.values[index]);
                 },
                ),
              ),
           ),
          ],
         ),
       ),  
   ),
 );
}