import 'package:flutter/material.dart';
import '../screens/product_screen.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return GridTile(
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed(ProductDetailScreen.routeName, arguments: product.id);
        },
        child: Image.network(product.imageUrl, fit: BoxFit.cover,),
        ),
      footer: GridTileBar(
        title: Text(product.title, textAlign: TextAlign.center,),
        backgroundColor: Color.fromRGBO(0, 0, 0, 0.5),

        leading: Consumer<Product>(
          builder: (ctx, product, _) => IconButton(
            icon: Icon(
              product.isFavorited ? Icons.favorite : Icons.favorite_border,
              color: Theme.of(context).primaryColor,
              ),
            onPressed: (){
              product.toggleFavoriteStatus();
            },
          ),
        ),

        trailing: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: (){ },
        ),
      ),
    );
  }
}
