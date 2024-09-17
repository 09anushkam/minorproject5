import 'package:flutter/material.dart';

class AddMoreItemsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add More Items')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add_product');
              },
              child: Text('Add More Item'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/next_screen'); // Navigate to next screen
              },
              child: Text('Save & Next'),
            ),
          ],
        ),
      ),
    );
  }
}
