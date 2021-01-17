import 'package:dementiacare/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import './homePage.dart';
import './Login.dart';
import 'package:flutter/material.dart';
import './Home.dart';

class UserManagement{
  Widget handleAuth(){
    return new StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, snapshot){
          if(snapshot.hasData){
            return homePage();
          }
          return LoginPage();
        },
    );
  }

  authorizeAccess(BuildContext context){
    FirebaseAuth.instance.currentUser().then((user){
      Firestore.instance.collection('/users').where(
        'uid', isEqualTo: user.uid).getDocuments().then((docs) {
        if (docs.documents[0].exists) {
          if (docs.documents[0].data['role'] == 'care') {
            Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context) => new homePage()));
          }
          else if (docs.documents[0].data['role'] == 'doc') {
            Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context) => new MyHomePage()));
          }
          else if (docs.documents[0].data['role'] == 'patient') {
            Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context) => new homePage()));
          }
        }
      }
        );
      });
  }
  signOut(){
    FirebaseAuth.instance.signOut();
  }
}