import 'package:flutter/material.dart';
import 'dart:io';
import 'product_list_screen.dart';
import '../models/product_model.dart';
import 'package:image_picker/image_picker.dart';

class AddProductScreen extends StatefulWidget {
  final List<Product> products;
  final Product? productToEdit; // Add this for editing functionality

  AddProductScreen({required this.products, this.productToEdit});

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  XFile? _image;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();

    // If editing a product, pre-fill the form fields
    if (widget.productToEdit != null) {
      _productNameController.text = widget.productToEdit!.name;
      _categoryController.text = widget.productToEdit!.category;
      _quantityController.text = widget.productToEdit!.quantity.toString();
      _priceController.text = widget.productToEdit!.price.toString();
      _image = XFile(widget.productToEdit!.imageUrl); // Use the existing image path
    }
  }

  Future<void> _pickImage() async {
    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = pickedImage;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('No image selected'),
        backgroundColor: Colors.red,
      ));
    }
  }

  void _saveProduct() {
    if (_formKey.currentState!.validate()) {
      if (_image == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please upload an image'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      String imageUrl = _image!.path;

      if (widget.productToEdit != null) {
        // Editing an existing product
        widget.productToEdit!.name = _productNameController.text;
        widget.productToEdit!.category = _categoryController.text;
        widget.productToEdit!.quantity = int.parse(_quantityController.text);
        widget.productToEdit!.price = double.parse(_priceController.text);
        widget.productToEdit!.imageUrl = imageUrl;
      } else {
        // Adding a new product
        Product newProduct = Product(
          name: _productNameController.text,
          category: _categoryController.text,
          imageUrl: imageUrl,
          quantity: int.parse(_quantityController.text),
          price: double.parse(_priceController.text),
        );

        widget.products.add(newProduct);
      }

      // Navigate to ProductListScreen with the updated products
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductListScreen(products: widget.products, shopName: ''),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.productToEdit == null ? 'Add Product' : 'Edit Product'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _productNameController,
                decoration: InputDecoration(labelText: 'Name of the Product'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the product name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _categoryController,
                decoration: InputDecoration(labelText: 'Category'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the category';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: _image == null
                      ? Center(child: Icon(Icons.camera_alt, size: 50, color: Colors.grey))
                      : Image.file(File(_image!.path), fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _quantityController,
                decoration: InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the quantity';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the price';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveProduct,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: Text(widget.productToEdit == null ? 'Add Item' : 'Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
