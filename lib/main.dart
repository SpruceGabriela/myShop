import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/product_overview_screen.dart';
import './providers/products_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => ProductsProvider(),
      child: MaterialApp(
        title: 'Shop App',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(244, 143, 177, 1),
          accentColor: Color.fromRGBO(128, 203, 196, 1),
          fontFamily: 'Lato',
        ),
        home: ProductOverviewScreen(),
      ),
    );
  }
}

