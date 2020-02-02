import 'package:flutter/material.dart';

class EditProductsScreen extends StatefulWidget {
  static const routeName = '/edit-product-screen';

  @override
  _EditProductsScreenState createState() => _EditProductsScreenState();
}

class _EditProductsScreenState extends State<EditProductsScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageFocusNode = FocusNode();
  final _urlController = TextEditingController();

  @override
  void initState() {
    _imageFocusNode.addListener(_updateImageURL);
    super.initState();
  }

  @override
  void dispose() {
    _imageFocusNode.removeListener(_updateImageURL);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageFocusNode.dispose();
    _urlController.dispose();
    super.dispose();
  }

  void _updateImageURL(){
    if(!_imageFocusNode.hasFocus){
      setState(() { });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(child: 
          ListView(children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Title'),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_priceFocusNode);
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Price'),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.numberWithOptions(),
              focusNode: _priceFocusNode,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_descriptionFocusNode);
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Description'),
              maxLines: 3,
              keyboardType: TextInputType.multiline, 
              focusNode: _descriptionFocusNode,             
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 80,
                  width: 80,
                  margin: EdgeInsets.only(top: 20, right: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    )
                  ),
                  child: _urlController.text.isEmpty ?
                  FittedBox(child: Text('Enter a URL'),) :
                  FittedBox(
                    child: Image.network(
                      _urlController.text,
                      fit: BoxFit.cover,
                    ),
                  )
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Image'),
                    keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.done,
                    controller: _urlController,
                    focusNode: _imageFocusNode,
                  ),
                )
              ],
            )
          ],),
        ),
      ),
    );
  }
}