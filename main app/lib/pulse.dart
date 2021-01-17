import'package:flutter/material.dart';
import'package:firebase_database/firebase_database.dart';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import'dart:async';

class pulse {
  final String key;
  int name;

  pulse.fromJson(this.key, Map data) {
    name = data['pulse'];
    if (name == null) {
      name = 0;
    }
  }
}

class pulseGraph extends StatefulWidget {
  pulseGraphState createState() => pulseGraphState();
}

class pulseGraphState extends State<pulseGraph> {
  StreamSubscription _subscriptionTodo;

   pulse pval;

  @override
  void initState() {
    super.initState();
    DatabaseReference pulseRef = FirebaseDatabase.instance.reference().child("pulse");
    pulseRef.once().then((DataSnapshot snap) {
      var p = snap.value.keys;
      var keys = snap.value;
      pval = p ;
      print(p);
    });
  }

  updateTodo(value) {
    var name = value.pulse;
    setState((){
      pval = name;
    });
  }

  Widget build(BuildContext context){
    return Container(
      child:Expanded( child:
      Text('95',
        style: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
      )
      ),
      )
    );
  }
}

