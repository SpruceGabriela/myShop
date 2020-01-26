import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/user_products_screen.dart';
import 'providers/orders.dart';
import 'screens/product_overview_screen.dart';
import './providers/products_provider.dart';
import './screens/product_screen.dart';
import './providers/cart.dart';
import './screens/cart_screen.dart';
import './providers/orders.dart';
import './screens/orders_screen.dart';
import './widgets/user_product_item.dart';

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
      ChangeNotifierProvider.value(
      value: Orders(),
      )
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop App',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(244, 143, 177, 1),
          accentColor: Color.fromRGBO(0, 137, 123, 1),
          fontFamily: 'Lato',
          iconTheme: IconThemeData(color: Colors.white),
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
        },
      ),
    );
  }
}
