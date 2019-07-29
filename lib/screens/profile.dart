import 'package:flutter/material.dart';
import 'package:custom_haven/screens/login.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:custom_haven/screens/profile_screens/messages.dart';
import 'package:custom_haven/screens/profile_screens/messagetest.dart';


class ProfileScreenState extends StatefulWidget{

  // const ProfileScreenState({
  //   Key key, 
  //   @required this.user
  //   }) : super(key: key);
  // final FirebaseUser user;

  @override
  ProfileScreen createState() => ProfileScreen();
}
class ProfileScreen extends State<ProfileScreenState> {
  
  Future<void> _signOut() async{
    FirebaseAuth.instance.signOut().then((_){
      print('success logging out');
      Navigator.push(
            context, MaterialPageRoute(builder: (context) => LogInFunction()));
    }).catchError((e) {
      print('failure logging out');
      print(e);
    });
  //   FirebaseAuth.instance.signOut();
  //   Future<FirebaseUser> Function() user = await FirebaseAuth.instance.currentUser;
  //   // Navigator.push(
  //   //   context, MaterialPageRoute(builder: (context) => LogInFunction()),
  //   // );

   }

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
          // Positioned(
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(vertical: 280, horizontal: 20),
          //     child: Text(
          //       " ACCOUNT",
          //       style: TextStyle(
          //         fontFamily: "WorkSans",
          //         fontWeight: FontWeight.w500,
          //         color: Colors.lightBlue[700],
          //       ),
          //     ),
          //   ),
          // ),
          //JUST USE LIST 4Head///
          //Padding(  
          ListView(
            padding: EdgeInsets.symmetric(vertical: 200, horizontal: 5),
            //scrollDirection: Axis.vertical,
            
            children: <Widget>[
              InkWell(
                onTap: (){
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Favorites Page'),
                      duration: new Duration(seconds: 1),
                    )
                  );
                },
                child: ListTile(
                title: Text("Favorites"),
                leading: Icon(Icons.favorite),
                trailing: Icon(Icons.chevron_right),
                
                
              ),
              ),

              InkWell(
                onTap: (){
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Opens your store'),
                      duration: new Duration(seconds: 1),
                    )
                  );
                },
                child: ListTile(
                title: Text("Your Virtual Store"),
                leading: Icon(Icons.store),
                trailing: Icon(Icons.chevron_right),
                //suffixIcon: Icon()
              ),
              ),

              InkWell(
                onTap: (){  
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MessageState()));
                },
                child: ListTile(
                title: Text("Your Messages"),
                leading: Icon(Icons.message),
                trailing: Icon(Icons.chevron_right),
              ),
              ),

              InkWell(
                onTap: (){
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Your account settings'),
                      duration: new Duration(seconds: 1),
                    )
                  );
                },
                child: ListTile(
                title: Text("Your Account"),
                leading: Icon(Icons.person),
                trailing: Icon(Icons.chevron_right),
              ),
              ),

              InkWell(
                onTap: (){
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Opens other miscellaneous settings'),
                      duration: new Duration(seconds: 1),
                    )
                  );
                },
                child: ListTile(
                title: Text("Settings"),
                leading: Icon(Icons.settings),
                trailing: Icon(Icons.chevron_right),
              ),
              ),
      
               Divider(),        

               InkWell(
                onTap: _signOut,
                child: ListTile(
                title: Text(
                  "Log Out",
                  style: TextStyle(color: Colors.red),
                  ),
                
              ),
              ),
            ],
            physics: const NeverScrollableScrollPhysics(),
          )
          //),
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
