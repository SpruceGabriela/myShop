import 'package:flutter/material.dart';
import 'screens/product_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop App',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: ProductOverviewScreen(),
    );
  }
}

