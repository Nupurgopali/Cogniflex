import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>{
  String email;
  String password;
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body : Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Email'),
              onChanged: (value){
                setState(() {
                  email = value;
                });
              },
            ),
            SizedBox(height:15.0),
            TextField(
              decoration: InputDecoration(hintText: 'Password'),
              onChanged: (value){
                setState(() {
                  password = value;
                });
              },
            ),
            SizedBox(height:15.0),
            RaisedButton(
              child: Text('Login'),
              color: Colors.blue,
              textColor: Colors.white,
              elevation: 7.0,
              onPressed: (){

              },
            ),
              SizedBox(height:15.0),
              RaisedButton(
                child: Text('Sign Up'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: (){
                    Navigator.of(context).pushNamed('/SignUp');
                },

            )
          ],
        )

      )
    );
  }
}