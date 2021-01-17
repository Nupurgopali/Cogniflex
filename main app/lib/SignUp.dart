import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class SignUpPage extends StatefulWidget {
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {

  String email;
  String password;

  Widget build (BuildContext context)
  {
    return new Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children : <Widget>[
              TextField(
                decoration: InputDecoration(hintText: 'Email'),
                onChanged: (value){
                  setState(() {
                    email = value;
                  });
                }
        ),
                SizedBox(height: 15,),
              TextField(
                  decoration: InputDecoration(hintText: 'Password'),
                  onChanged: (value){
                    setState(() {
                      password = value;
                    });
                  }
              ),

              SizedBox(height:15),

          RaisedButton(
              child: Text('Sign Up'),
              color: Colors.blue,
              textColor: Colors.white,
              elevation: 7.0,
              onPressed: (){
                FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then
                  ((value) => null);
              },
          ),
            ]
          )
        )
      )
    );
  }
}