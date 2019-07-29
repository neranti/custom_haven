import 'package:custom_haven/widgets/bottomnavbar.dart';
import 'package:flutter/material.dart';
//import 'package:custom_haven/widgets/store.dart';
//import 'package:custom_haven/widgets/data.dart';
import 'package:custom_haven/widgets/custom_card.dart';

class HomeScreenState extends StatefulWidget {
  @override
  HomeScreen createState() => new HomeScreen();
 
}

class HomeScreen extends State<HomeScreenState> {
    @override
    Widget build(BuildContext context) {
      return CustomCards();
      //return ActualNavBarState();

   }  
  
}
