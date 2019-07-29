import 'package:flutter/material.dart';
import 'package:custom_haven/screens/profile.dart';
//import 'package:custom_haven/widgets/custom_card.dart';
//import 'package:custom_haven/screens/home.dart';
import 'package:flutter/rendering.dart';
//import 'package:custom_haven/widgets/store.dart';


class CartState extends StatefulWidget{
  @override 
  CartScreen createState() => CartScreen();
}

class CartScreen extends State<CartState> {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          ClipPath(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                  stops: [0.1, 0.4, 0.7, 0.9],
                  colors: [
                    Colors.cyanAccent,
                    Colors.cyanAccent[400],
                    Colors.lightBlue[700],
                    Colors.lightBlue[900],
                  ],
                ),
              ),
            ),
          clipper: getClipper(),
          ),  
          titleSection,
        ],
      ),
      bottomNavigationBar: new Container(
        color: Colors.white.withOpacity(1),
        child: Row(
          children: <Widget>[
            Expanded(
              child: MaterialButton(
                color: Colors.lightBlue[500],
                onPressed: (){
                  Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('Buying not supported yet.')));
                },
                child: new Text(
                  "Proceed to Checkout",
                  style: TextStyle(
                    fontFamily: "WorkSans",
                    fontWeight: FontWeight.w700,
                  ),
                  ),

              )
            )
          ],
        ),
      ),
    );
  }

  // Widget ShoeCardContainer = Container(
  //   child: _buildCart(cards
  //     .where((shoeData) => userCart.contains(shoeData.id))
  //     .toList()),
  // );

  @override
  Widget titleSection = Container(
    child: Column (
      //mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
        //Padding(
          //padding: EdgeInsets.all(10),
            child: Text(
              "Shopping Cart",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w700,
                fontSize: 30.0,
              ),
            ),
        ),
      ],
    ),
  );


}
