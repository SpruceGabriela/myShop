import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import './cart.dart';
import 'cart.dart';

class OrderItem{
  final String id;
  final double amount;
  final List<CardItem> products;
  final DateTime dateTime;

  OrderItem({
   @required this.amount,
   @required this.dateTime,
   @required this.id,
   @required this.products
  });
}

class Orders with ChangeNotifier{
  List<OrderItem> _orders = [];

  List<OrderItem> get orders{
    return [..._orders];
  }

  void addOrder(List<CardItem> cartProducts, double total){
    _orders.insert(
      0,
      OrderItem(
      id: DateTime.now().toString(),
      amount: total,
      dateTime: DateTime.now(),
      products: cartProducts,
      ),
    );
    notifyListeners();
  }
}