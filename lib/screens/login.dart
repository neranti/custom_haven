import 'package:flutter/material.dart';
import 'package:custom_haven/widgets/google_sign_in_button.dart';
import 'package:custom_haven/widgets/bottomnavbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:custom_haven/screens/signup.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:custom_haven/screens/profile.dart';
//import 'package:custom_haven/sevices/auth_service.dart';

class LogInFunction extends StatefulWidget{
  @override
  LoginScreen createState() => LoginScreen();
}

class LoginScreen extends State<LogInFunction> {
  
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _loginemail, _loginpassword;

      Future<void> loginWithWithEmailPassword() async{
      final formState = _formKey.currentState;
      if(formState.validate()){
        formState.save();
        try{
          FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _loginemail, 
          password: _loginpassword,
        );
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => ActualNavBarState()),
          );
        }catch(e){
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text('Your password or email is invalid.')));
        }
      }
    }

  GoogleSignIn _loginWithGoogle = new GoogleSignIn(
   scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
   ],
  );

  initLogin() {
    _loginWithGoogle.onCurrentUserChanged.listen((GoogleSignInAccount account) async {
      if (account != null) {
        // user logged
      } else {
        // user NOT logged
      }
    });
    _loginWithGoogle.signInSilently();
  }

  doLogin() async {
    //showLoading();
    await _loginWithGoogle.signIn();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            children: <Widget>[
              SizedBox(height: 100.0),
              TextFormField(
                onSaved: (input) => _loginemail = input,
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
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter email';
                  }
                  return null;
                },
              ),
              Padding(
                padding: EdgeInsets.all(7.0),
              ),
              TextFormField(
                onSaved: (input) => _loginpassword = input,
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
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
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
                  onPressed: loginWithWithEmailPassword,
                  //() {
                    // Navigator.push(
                    //   context, MaterialPageRoute(builder: (context) => NBNavigation()),
                    // );
                  //},
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
                      doLogin();
                    },
                  ),
                ],
              ),
            ], 
          ),
        ), 
      ),
    );
  // TextEditingController loginEmailController = new TextEditingController();
  // TextEditingController loginpasswordController = new TextEditingController();
  

  }
}