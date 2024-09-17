import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/shop_details_screen.dart';
import 'screens/add_product_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShopLocalia',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => LoginScreen() ,
        '/registration': (context) => RegistrationScreen(),
        '/shop-details': (context) => ShopDetailsScreen(),
        '/add-product': (context) => AddProductScreen(),
        // Add more routes as needed
      },
    );
  }
}
