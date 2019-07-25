import 'package:flutter/material.dart';
import 'package:custom_haven/widgets/google_sign_in_button.dart';
import 'package:custom_haven/widgets/bottomnavbar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Testing extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new LoginScreen());
  }

//   Widget _showCircularProgress(){
//   if (_isLoading) {
//     return Center(child: CircularProgressIndicator());
//   } return Container(height: 0.0, width: 0.0,);

// }
}

class LoginScreen extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new DefaultTabController(
        length: 2,
        child: Scaffold(
        appBar: new PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: new Container(
            height: 100.0,
            //color: Colors.grey[300],
            child: Column(
              children: <Widget>[
                new Expanded(child: new Container()),
                new TabBar(
                  unselectedLabelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.cyanAccent,
                        Colors.lightBlue[700],
                      ],
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  tabs: [
                    new Tab(
                      text: "Log In",
                      ),
                    new Tab(
                      text: "Register",
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: new TabBarView(
          children: <Widget>[
            //_showCircularProgress(),
            new LoginState(),
            new SignUpState(),
          ],
        ),
        ),
      ),
    );
    
  }
}

class LoginState extends StatefulWidget {
  @override
  Login createState() => Login();
}

class Login extends State<LoginState> {

  bool _isHidden = true;

  void _toggleVisibility(){
    setState(() {
      _isHidden = !_isHidden;
    });
  }

TextEditingController usernameController = new TextEditingController();


  void testingMethod() {
    print(usernameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            children: <Widget>[
              SizedBox(height: 100.0),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: Icon(Icons.email, color: Colors.black),
                    onPressed: testingMethod,
                  ),
                  contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 20.0, 15.0),
                  hintText: "Email",
                  hintStyle: TextStyle(fontFamily: 'WorkSans'),
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                  ),
                  filled: false,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(7.0),
              ),
              TextField(
                obscureText: _isHidden,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: Colors.black),
                  suffixIcon: IconButton(
                    icon: _isHidden ? Icon(Icons.visibility_off, color: Colors.black,) : Icon(Icons.visibility, color: Colors.black,),
                    onPressed: _toggleVisibility,
                  ),
                  hintText: "Password",
                  hintStyle: TextStyle(fontFamily: 'WorkSans'),
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                  ),
                  contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 20.0, 15.0),
                  filled: false,
                ),
              ),
              
              Padding(
                padding: EdgeInsets.all(5.0),
              ),

              new Container(
                child: new RaisedButton(
                //   child: Container(
                //     decoration: BoxDecoration(
                //       gradient: LinearGradient(
                //         begin: Alignment.topCenter,
                //         end: Alignment.center,
                //         stops: [0.1, 0.4, 0.7, 0.9],
                //         colors: [
                //           Colors.cyanAccent,
                //           Colors.cyanAccent[400],
                //           Colors.lightBlue[700],
                //           Colors.lightBlue[900],
                //         ],
                //       ),
                //     ),
                // ),
                  child: new Text("Login", style: TextStyle(fontFamily: 'WorkSans'),), 
                  color: Colors.lightBlue[700],
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  onPressed: () {
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) => NBNavigation()),
                    );
                  },
                ),
              ),

              Row(
                children: <Widget>[
                  Expanded(
                    child: new Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      child: Divider(color: Colors.black,)
                    ),
                  ),
                  Text(" OR ", textAlign: TextAlign.center,),        
                  Expanded(
                    child: new Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      child: Divider(color: Colors.black,)
                    ),
                
                    // child: Divider(color: Colors.black,)
                  ),
                ]
              ),
              new Column(
                children: <Widget>[
                  SizedBox(height: 10.0),
                    GoogleSignInButton(
                    onPressed: () {
                      Navigator.push(
                      context, MaterialPageRoute(builder: (context) => NBNavigation()),
                      );
                    },
                  ),
                ],
              ),
            ], 
          ),
        ), 
      ),
    );
  }
}

class SignUpState extends StatefulWidget{
  @override
  SignUp createState() => SignUp();
}

class SignUp extends State<SignUpState> {
  TextEditingController usernameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final FirebaseAuth mAuth = FirebaseAuth.instance;


  final _formKey = GlobalKey<FormState>();

  bool _isHidden = true;

  void _toggleVisibility(){
    setState(() {
      _isHidden = !_isHidden;
    });
  }

void signUpWithEmailPassword()
    async {
      FirebaseUser user = await mAuth.createUserWithEmailAndPassword(
        email: emailController.text, 
        password: passwordController.text
      );
    }

  @override
  Widget build(BuildContext context) {
    return Form(
      // debugShowCheckedModeBanner: false,
      //home: new Scaffold(
      key: _formKey,
        child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            children: <Widget>[
              SizedBox(height: 100.0),
              TextFormField(
                //controller: usernameController,
                decoration: InputDecoration(
                  hintText: "Username",
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                  ),
                  contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 20.0, 15.0),
                  filled: false,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Username is required';
                  }
                  return null;
                },
                //onSaved: (value),
              ),
              Padding(
                padding: EdgeInsets.all(7.0),
              ),
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Email is required';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                  ),
                  contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 20.0, 15.0),
                  filled: false,
                ),
                
              ),
              Padding(
                padding: EdgeInsets.all(7.0),
              ),
              TextFormField(
                controller: passwordController,
                obscureText: _isHidden,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: _isHidden ? Icon(Icons.visibility_off, color: Colors.black,) : Icon(Icons.visibility, color: Colors.black,),
                    onPressed: _toggleVisibility,
                  ),
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                  ),
                  contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 20.0, 15.0),
                  filled: false,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
              ),
              Padding(
                padding: EdgeInsets.all(7.0),
              ),
              new Container(
              child: new MaterialButton(
                  minWidth: 10.0,
                  //padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child: new Text("Register"), 
                  color: Colors.lightBlue[700],
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      signUpWithEmailPassword();
                      Navigator.push(
                         context, MaterialPageRoute(builder: (context) => NBNavigation()),
                     );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}