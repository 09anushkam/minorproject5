// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class AddProductScreen extends StatefulWidget {
//   @override
//   _AddProductScreenState createState() => _AddProductScreenState();
// }
//
// class _AddProductScreenState extends State<AddProductScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _productNameController = TextEditingController();
//   final TextEditingController _categoryController = TextEditingController();
//   final TextEditingController _quantityController = TextEditingController();
//   final TextEditingController _priceController = TextEditingController();
//
//   File? _image;
//   final ImagePicker _picker = ImagePicker();
//
//   @override
//   void dispose() {
//     _productNameController.dispose();
//     _categoryController.dispose();
//     _quantityController.dispose();
//     _priceController.dispose();
//     super.dispose();
//   }
//
//   Future<void> _requestPermission() async {
//     final status = await Permission.photos.request();
//     if (status.isDenied) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Permission to access photos is required.'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }
//
//   Future<void> _pickImage() async {
//     await _requestPermission();
//
//     final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
//
//     if (pickedImage != null) {
//       final File imageFile = File(pickedImage.path);
//       int fileSize = await imageFile.length(); // Size in bytes
//
//       if (fileSize > 600 * 1024) { // Restrict to 600KB
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text('Image size should be less than 600KB'),
//           backgroundColor: Colors.red,
//         ));
//       } else {
//         setState(() {
//           _image = imageFile;
//         });
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('No image selected'),
//         backgroundColor: Colors.red,
//       ));
//     }
//   }
//
//   void _addProduct() {
//     if (_formKey.currentState!.validate()) {
//       // Commenting out this block to allow proceeding without an image
//       /*
//       if (_image == null) {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text('Please upload an image'),
//           backgroundColor: Colors.red,
//         ));
//         return;
//       }
//       */
//       // Save product details
//       // After saving, perform necessary actions, such as navigating back or showing a success message
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Product added successfully'),
//         backgroundColor: Colors.green,
//       ));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: Text('Add Product'),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextFormField(
//                 controller: _productNameController,
//                 decoration: InputDecoration(labelText: 'Name of the Product'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the product name';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 controller: _categoryController,
//                 decoration: InputDecoration(labelText: 'Category'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the category';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20),
//               GestureDetector(
//                 onTap: _pickImage,
//                 child: Container(
//                   width: double.infinity,
//                   height: 150,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[300],
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: Colors.grey),
//                   ),
//                   child: _image == null
//                       ? Center(child: Icon(Icons.camera_alt, size: 50, color: Colors.grey))
//                       : Image.file(_image!, fit: BoxFit.cover),
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 controller: _quantityController,
//                 decoration: InputDecoration(labelText: 'Quantity'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the quantity';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 controller: _priceController,
//                 decoration: InputDecoration(labelText: 'Price'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the price';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _addProduct,
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//                 child: Text('Add Item'),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
//         ],
//         selectedItemColor: Colors.green,
//         onTap: (index) {
//           // Handle bottom navigation actions
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../services/firebase_service.dart';
import '../widgets/custom_text_field.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  FirebaseService _firebaseService = FirebaseService();

  @override
  void dispose() {
    _nameController.dispose();
    _categoryController.dispose();
    _quantityController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _addProduct() {
    final product = Product(
      name: _nameController.text,
      category: _categoryController.text,
      imageUrl: 'your_image_url', // Handle image upload separately
      quantity: int.parse(_quantityController.text),
      price: double.parse(_priceController.text),
    );

    _firebaseService.addProduct(product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Products')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(controller: _nameController, labelText: 'Product Name'),
            CustomTextField(controller: _categoryController, labelText: 'Category'),
            CustomTextField(controller: _quantityController, labelText: 'Quantity'),
            CustomTextField(controller: _priceController, labelText: 'Price'),
            ElevatedButton(
              onPressed: _addProduct,
              child: Text('Add Item'),
            ),
          ],
        ),
      ),
    );
  }
}
