import 'package:flutter/material.dart';

class CartProductsState extends StatefulWidget {
  @override 
  CartProducts createState() => CartProducts();
}

class CartProducts extends State<CartProductsState> {
  @override 
  Widget build(BuildContext content){
    return new ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index){

      }
    );
  }
}