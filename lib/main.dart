import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/shop_details_screen.dart';
import 'screens/add_product_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCJ7Tv-CpRxXeKkx2MuYSfB7xxpUq9XoaM",
          authDomain: "minor-eb3de.firebaseapp.com",
          databaseURL: "https://minor-eb3de-default-rtdb.firebaseio.com",
          projectId: "minor-eb3de",
          storageBucket: "minor-eb3de.appspot.com",
          messagingSenderId: "629625107390",
          appId: "1:629625107390:web:2d17686c1d302eb05b3fef",
          measurementId: "G-K3HFSFD5B5"
      ),
    );
  }
  else{
    Firebase.initializeApp();
  }

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
