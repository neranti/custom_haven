import 'package:flutter/material.dart';
import 'package:custom_haven/screens/login.dart';

class ProfileScreen extends StatelessWidget {


  @override 
  Widget build(BuildContext context) {
    //testingMethod();
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
          Positioned(
            width: MediaQuery.of(context).size.height / 2.2,
            top: 100,
            child: Column(
              children: <Widget>[
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    image: DecorationImage(
                      image: AssetImage('assets/profile.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(75.0)),
                  ),
                )
              ],
            ),
          ), 
          Positioned(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 280, horizontal: 20),
              child: Text(
                "ACCOUNT",
                style: TextStyle(
                  fontFamily: "WorkSans",
                  fontWeight: FontWeight.w500,
                  color: Colors.lightBlue[700],
                ),
              ),
            ),
          ),
          //JUST USE LIST 4Head///
          ListView(
            children: <Widget>[
              
            ],
          )
        ],  
      ),
    );
  }
}


class getClipper extends CustomClipper<Path>{
  @override 
  Path getClip(Size size){
    var path = new Path();
    path = Path();
    path.lineTo(0.0, size.height / 3.0);
    path.lineTo(size.width / 1 , size.height / 3.0);
    path.lineTo(size.width / 1 , 0.0);
    
    path.close();
    return path;
  }
   @override 
   bool shouldReclip(CustomClipper<Path> oldClipper) {
     return true;
   }
}
