import 'package:flutter/material.dart';
import '../providers/orders.dart' as ord;
import 'package:intl/intl.dart';

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;

  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(children: <Widget>[
        ListTile(
          title: Text('\$${widget.order.amount}'),
          subtitle: Text(DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime)),
          trailing:
            IconButton(icon: Icon(!_expanded ? Icons.expand_more : Icons.expand_less),
            onPressed:  (){
              setState(() {
                _expanded = !_expanded;
              });
            },
          ),
        ),
        if(_expanded)
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(vertical: 10),
            height: 100,
            child: ListView(children: <Widget>[
              ...widget.order.products.map(
                (product) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                      Text(product.title, style: TextStyle(fontSize: 18),),
                      Text('${product.quantity}x\$${product.price}', style: TextStyle(fontSize: 18, color: Colors.grey),)
                    ],
                  )
                ).toList(),
            ],),
          ),
      ],),
    );
  }
}