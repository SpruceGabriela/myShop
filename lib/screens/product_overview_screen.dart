import 'package:flutter/material.dart';
import '../widgets/grid_product.dart';

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MyShop', style: TextStyle(color: Colors.white),)),
      body: GridProduct(),
    );
  }
}


