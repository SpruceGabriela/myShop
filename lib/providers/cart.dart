import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class CardItem{
  final String id;
  final String title;
  final int quantity;
  final double price;

  CardItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CardItem> _items = {};

  Map<String, CardItem> get items{
    return {..._items};
  }

  int get itemCount{
    return _items.length;
  }

  double get totalAmount{
    var total = 0.0;
    _items.forEach((key, cardItem){
      total += cardItem.price * cardItem.quantity;
    });
    return total;
  }

  void addItem(String productId, double price, String title,){
    if(_items.containsKey(productId)){
      _items.update(
        productId,
        (existingCardItem) => CardItem(
          id: existingCardItem.id,
          title: existingCardItem.title,
          price: existingCardItem.price,
          quantity: existingCardItem.quantity + 1,
        )  
        );
    }else{
      _items.putIfAbsent(
        productId,
        () => CardItem(id: DateTime.now().toString(),
        title: title,
        price: price,
        quantity: 1
        ));
    }
    notifyListeners();
  }

  void removeItem(String productId){
    _items.remove(productId);
    notifyListeners();
  }

} 