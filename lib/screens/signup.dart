import 'package:flutter/material.dart';
//import 'package:custom_haven/widgets/google_sign_in_button.dart';
import 'package:custom_haven/widgets/bottomnavbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:custom_haven/screens/login.dart';

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
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
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