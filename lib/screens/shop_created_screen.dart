import 'package:flutter/material.dart';
import 'dart:io';
import '../models/product_model.dart';
import 'registration_screen.dart';

class ShopCreatedScreen extends StatefulWidget {
  final List<Product> products;
  final String shopName;

  ShopCreatedScreen({required this.products, required this.shopName});

  @override
  _ShopCreatedScreenState createState() => _ShopCreatedScreenState();
}

class _ShopCreatedScreenState extends State<ShopCreatedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('${widget.shopName} - Shop Created', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shop created successfully',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            SizedBox(height: 10),
            Text('Please review the item details once:', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: widget.products.length,
                itemBuilder: (context, index) {
                  final product = widget.products[index];
                  return ListTile(
                    leading: product.imageUrl == null || product.imageUrl.isEmpty
                        ? Icon(Icons.image, size: 50)
                        : Image.file(File(product.imageUrl), width: 50, height: 50, fit: BoxFit.cover),
                    title: Text(product.name),
                    subtitle: Text('${product.category} - Rs. ${product.price}'),
                  );
                },
              ),
            ),
            Text(
              '... and many more',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to the previous screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'BACK',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Logic for finalizing or continuing to the next stage
                // Navigate to RegistrationScreen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegistrationScreen(), // Replace this with your actual RegistrationScreen
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'OK',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
