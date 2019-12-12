import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return GridTile(
        child:Image.network(imageUrl, fit: BoxFit.cover,),
      footer: GridTileBar(
        title: Text(title, textAlign: TextAlign.center,),
        backgroundColor: Color.fromRGBO(0, 0, 0, 0.5),
        leading: IconButton(
          icon: Icon(Icons.favorite, color: Theme.of(context).primaryColor,),
          onPressed: (){},
        ),
        trailing: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: (){},
        ),
      ),
    );
  }
}
