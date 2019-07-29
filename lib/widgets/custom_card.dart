import 'package:custom_haven/screens/home.dart';
import 'package:flutter/material.dart';

import 'data.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:custom_haven/widgets/data.dart';



class CustomCards extends StatelessWidget {
  
  final ShoeCardData shoeData;
  //final bool inFavorites,
  final bool inCart;
  //final Function onFavoriteButtonPressed,
  final Function onCartButtonPressed;

  // enum ShoeType {
  // shoe
  // } 

  CustomCards( {
    
       @required this.shoeData,
       //@required this.inFavorites,
       @required this.inCart,
       //@required this.onFavoriteButtonPressed,
       @required this.onCartButtonPressed,
  });
    
    @override 
    Widget build(BuildContext context) { 
    
      RawMaterialButton _buildFavoriteButton() {
        return RawMaterialButton(
          constraints: const BoxConstraints(minWidth: 40.0, minHeight: 40.0),
          onPressed: () => print("Put in Favorites"),
          child: Icon(
            //inFavorites == true ? Icons.favorite : 
            Icons.favorite_border,
          ), 
          elevation: 5.0,
          fillColor: Colors.white,
          shape: CircleBorder(),
        );
      }
    
      RawMaterialButton _buildCartButton() {
        var shoeData;
                return RawMaterialButton(
                  constraints: const BoxConstraints(minWidth: 40.0, minHeight: 40.0),
                  onPressed: () => onCartButtonPressed(shoeData.id),
                  // if (shoeData.id == null){
                  //   print("returned null");
                  // }else{
                  //   print("object");
                  // }
          
                  // onCartButtonPressed(shoeData.id);
                  //   if(shoeData.id == null) {
                  //     return print("null");
                  //   }else{
                  //     return print("object");
                  //   }
                  
                  child: Icon(
                    inCart == false ? Icons.shopping_cart : OMIcons.shoppingCart
                  ),
                  elevation: 5.0,
                  fillColor: Colors.white,
                  shape: CircleBorder()
          
            // @override
            // Widget build(BuildContext context) {
            //   return null;
            // },
                );
              }
          
              Padding _buildTitleSection() {
                return Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      Text(
                        "Red Bape Vans",
                        style: TextStyle(
                          fontFamily: 'WorkSans',
                          fontWeight: FontWeight.bold,
                          ),
                        
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        "Designer Name",
                        style: TextStyle(
                          fontFamily: 'WorkSans',
                          fontWeight: FontWeight.w300,
                          ),
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        children: [
                          //SizedBox(width: 5.0),
                          Text(
                            "\$120.00",                                                                                                                                                                                                                                                                                                                        
                             style: TextStyle(fontFamily: 'WorkSans'),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
          
              //onTap: () => print("Tapped!"),
                //child: Padding(
                  //padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height / 8.0, vertical: 5.0),
                  List<Card> _buildGridCards(int count) {  
                    List<Card> cards = List.generate(
                      count,
                        (int index) => Card(      
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    AspectRatio(
                                      aspectRatio: 16.0 / 9.0,
                                      child: Image.asset(
                                        "assets/redbapevans.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  Positioned(
                                    child: _buildFavoriteButton(),
                                    top: 2.0,
                                    right: 2.0,
                                  ),
                                ],
                              ),
                            new Stack(
                              children: <Widget>[
                                _buildTitleSection(),
                                Positioned(
                                  child: _buildCartButton(),
                                  bottom: 0.0,
                                  right: 10.0,
                                ),
                              ],
                            )
                        //_buildTitleSection(),
                          ],
                        ),
                      ),
                    );
                  return cards;
                }
                return Scaffold(
                  
                 //child: Padding(
                   //padding: EdgeInsets.symmetric(vertical: 30),
                  appBar: PreferredSize(
                    preferredSize: Size.fromHeight(50.0),
                    child: AppBar(
                      title: Text(
                        "CustomShoes",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        ),
                      backgroundColor: Colors.lightBlue[500],
                    ),
                    ), 
                  //),
                  body: GridView.count(
                  crossAxisCount: 2,
                  padding: EdgeInsets.all(16.0),
                  childAspectRatio: 8.0 / 9.0,
                  children: _buildGridCards(2) 
                ),
               );
   }
            
          
            // @override
            // Widget build(BuildContext context) {
              
            //   return null;
            // }
          
            //onCartButtonPressed(id) {}
      
  }
//R }