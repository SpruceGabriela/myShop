import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/product_overview_screen.dart';
import './providers/products_provider.dart';
import './screens/product_screen.dart';
import './providers/cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider.value(
      value: ProductsProvider(),
      ),
      ChangeNotifierProvider.value(
      value: Cart(),
      ),
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop App',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(244, 143, 177, 1),
          accentColor: Color.fromRGBO(128, 203, 196, 1),
          fontFamily: 'Lato',
          iconTheme: IconThemeData(color: Colors.white),
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}

