import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../providers/products_provider.dart';


class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;
  // ProductDetailScreen(this.title, this.price);

  static const routeName = 'products-detail'; 

  @override
  Widget build(BuildContext context) {
    final _productId = ModalRoute.of(context).settings.arguments as String;
    final ProductsProvider _productsProvider = Provider.of<ProductsProvider>(context);
    final Product _product = _productsProvider.getByID(_productId);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _product.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}