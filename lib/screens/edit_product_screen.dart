import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/providers/products_provider.dart';

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
  final _form = GlobalKey<FormState>();
  var _editedProduct = Product(
    title: '',
    id: null,
    description: '',
    imageUrl: '',
    price: 0,
  );

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

  void _saveForm(){
    final isValid = _form.currentState.validate();
    if(!isValid){
      return;
    }
    _form.currentState.save();
    
    Provider.of<ProductsProvider>(context, listen: false).addProduct(_editedProduct);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Products'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){
              _saveForm();
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
          child: Form(
            key: _form,
            child: ListView(children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                validator: (value){
                  if(value.isEmpty){
                     return 'Please provide a title';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProduct = Product(
                    title: value,
                    description: _editedProduct.description,
                    price: _editedProduct.price,
                    imageUrl: _editedProduct.imageUrl,
                    id: null,
                  );
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
                validator: (value){
                  if(value.isEmpty){
                     return 'Please enter a price';
                  }
                  if(double.tryParse(value) == null){
                    return "Please enter a valid number";
                  }
                  if(double.parse(value) <= 0){
                    return "Please enter a number greater than zero";
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProduct = Product(
                    title: _editedProduct.title,
                    description: _editedProduct.description,
                    price: double.parse(value),
                    imageUrl: _editedProduct.imageUrl,
                    id: null,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                keyboardType: TextInputType.multiline, 
                focusNode: _descriptionFocusNode,
                validator: (value){
                  if(value.isEmpty){
                     return 'Please enter a description';
                  }
                  if(value.length < 10) {
                    return 'Should be at least 10 characters long';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProduct = Product(
                    title: _editedProduct.title,
                    description: value,
                    price: _editedProduct.price,
                    imageUrl: _editedProduct.imageUrl,
                    id: null,
                  );
                },         
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
                      validator: (value){
                        if(value.isEmpty){
                          return 'Please provide an image URL';
                        }
                        if(!value.startsWith('http') && !value.startsWith('https')){
                          return 'Please enter a valid URL';
                        }
                        if(!value.endsWith('.png') && !value.endsWith('.jpg') && !value.endsWith('.jpeg')){
                          return 'Please enter a valid image format';
                        }
                        return null;
                      },
                      onFieldSubmitted: (_) {
                        _saveForm();
                      },
                      onSaved: (value) {
                        _editedProduct = Product(
                          title: _editedProduct.title,
                          description: _editedProduct.description,
                          price: _editedProduct.price,
                          imageUrl: value,
                          id: null,
                        );
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}