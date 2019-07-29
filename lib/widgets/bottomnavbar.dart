//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:custom_haven/screens/login.dart';
import 'package:custom_haven/screens/home.dart';
import 'package:custom_haven/screens/cart.dart';
import 'package:custom_haven/screens/profile.dart';
import 'package:custom_haven/widgets/data.dart';
import 'package:custom_haven/widgets/custom_card.dart';
import 'package:custom_haven/widgets/store.dart';
//import package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NBNavigation extends StatefulWidget {

  @override
  NavBar createState() => NavBar();
}



class NavBar extends State<NBNavigation> {

  List<ShoeCardData> cards = getCustomCards();
  List<String> userCart = getCartIDs();

  void _handleCartListChanged(String cartID) {
    setState(() {
      if (userCart.contains(cartID)) {
        userCart.remove(cartID);
      } else {
        userCart.add(cartID);
      }
    });
  }

  // _buildCart(cards
  //  .where((shoeData) => userCart.contains(shoeData.id))
  //  .toList()),


  @override
  Widget build(BuildContext context) {

     return ActualNavBarState();

    Column _buildCart(List<ShoeCardData> cardList) {
      return Column( 
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: cardList.length,
              itemBuilder: (BuildContext context, int index) {
                return new CustomCards(
                  // shoeData: cardList[index],
                  // inCart: userCart.contains(cardList[index].id),
                  //onCartButtonPressed: _handleCartListChanged,
                );
              },
            ),
          ), 
        ],
      );
    }
   
  }  
}

  

  class ActualNavBarState extends StatefulWidget{
  //   const ActualNavBarState({
  //   Key key, 
  //   @required this.user
  //   }) : super(key: key);
  // final FirebaseUser user;

     @override
     ActualNavBar createState() => ActualNavBar();
  }

  class ActualNavBar extends State<ActualNavBarState>{
    //@override 
    //Widget build(BuildContext context) {
      int _selectedIndex = 0;
      final _pages = [
        HomeScreenState(),
        Text("data3"),
        CartState(
        // _buildCart(cards
        //  .where((shoeData) => userCart.contains(shoeData.id))
        //  .toList()),
        ),
        ProfileScreenState(),
      ];

  @override 
  Widget build(BuildContext context) {
    return Container(
      //debugShowCheckedModeBanner: false,
      child: Scaffold( 
        body: _pages[_selectedIndex],
        //****BOTTOM NAV BAR*****
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          //selectedItemColor: Colors.pink,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index; 
            });
          },
           
          type: BottomNavigationBarType.fixed, 
          backgroundColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black),
              title: new Text('Home'), 
            ), 
            BottomNavigationBarItem(
              icon: new Icon(Icons.search, color: Colors.black),
              title: new Text('Search'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, color: Colors.black),
              title:Text('Cart'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black),
              title: Text('Profile'),
            ),
          ],
        ),
        //****BOTTOM NAV BAR*****
      ),
     );
     
    }
  }
  
//@override 
//Widget build(BuildContext context) {
  
  // int _selectedIndex = 0;
  // final _pages = [
  //   HomeScreenState(),
  //   // CustomCards(),
  //   Text("data3"),
  //   CartState(
  //     // _buildCart(cards
  //     //  .where((shoeData) => userCart.contains(shoeData.id))
  //     //  .toList()),
  //   ),
  //   ProfileScreen(),
  // ];
  // //@override 
  // //Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: Scaffold( 
  //       body: _pages[_selectedIndex],
  //       //****BOTTOM NAV BAR*****
  //       bottomNavigationBar: BottomNavigationBar(
  //         currentIndex: _selectedIndex,
  //         //selectedItemColor: Colors.pink,
  //         onTap: (int index) {
  //           setState(() {
  //             _selectedIndex = index; 
  //           });
  //         },
           
  //         type: BottomNavigationBarType.fixed, 
  //         backgroundColor: Colors.grey,
  //         items: [
  //           BottomNavigationBarItem(
  //             icon: Icon(Icons.home, color: Colors.black),
  //             title: new Text('Home'), 
  //           ), 
  //           BottomNavigationBarItem(
  //             icon: new Icon(Icons.search, color: Colors.black),
  //             title: new Text('Search'),
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Icon(Icons.shopping_cart, color: Colors.black),
  //             title:Text('Cart'),
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Icon(Icons.person, color: Colors.black),
  //             title: Text('Profile'),
  //           ),
  //         ],
  //       ),
  //       //****BOTTOM NAV BAR*****
  //     ),
  //    );
     
  // }
   // }
//}
