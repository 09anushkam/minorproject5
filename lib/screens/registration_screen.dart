import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            Image.asset('assets/logo.png', height: 40),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ShopLocalia', style: TextStyle(fontSize: 16)),
                Text('Empowering Locals, Enhancing Lives', style: TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
        leading: Icon(Icons.menu),
        actions: [
          IconButton(
            icon: Icon(Icons.location_on),
            onPressed: () {
              // Location update action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Shop Registrations', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            CustomButton(
              buttonText: 'Add Shop',
              onPressed: () {
                // Navigate to ShopDetailsScreen
                Navigator.pushNamed(context, '/shop-details');
              },
            ),
            SizedBox(height: 20),
            CustomButton(
              buttonText: 'Your Existing Shop',
              onPressed: () {
                // Navigate to Existing Shop Screen
                Navigator.pushNamed(context, '/existing-shop');
              },
            ),
            SizedBox(height: 40),
            Text('Service Registrations', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            CustomButton(
              buttonText: 'Add Service',
              onPressed: () {
                // Action to add service
              },
            ),
            SizedBox(height: 20),
            CustomButton(
              buttonText: 'Update your Service',
              onPressed: () {
                // Action to update service
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
        selectedItemColor: Colors.green,
        onTap: (index) {
          // Handle bottom navigation actions
        },
      ),
    );
  }
}
