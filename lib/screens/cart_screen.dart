import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart',
        style: TextStyle(color: Colors.white),
        ),
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: Column(children: <Widget>[
        Card(
          margin: EdgeInsets.all(15),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Text('Total',
              style: TextStyle(fontSize: 20),
              ),
              Spacer(),
              Chip(
                label: Text('\$${cart.totalAmount}'),
                backgroundColor: Theme.of(context).primaryColor,
              ),
              FlatButton(child: Text('ORDER NOW'), onPressed: (){}, textColor: Theme.of(context).accentColor,),
            ],),
          ),
        ),
        SizedBox(height: 10,),
        Expanded(
          child: ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: 
            (ctx, index) => CartItem(
              cart.items.values.toList()[index].id,
              cart.items.keys.toList()[index],
              cart.items.values.toList()[index].price,
              cart.items.values.toList()[index].quantity,
              cart.items.values.toList()[index].title
            ),
          ),
        ),
      ],),
    );
  }
}