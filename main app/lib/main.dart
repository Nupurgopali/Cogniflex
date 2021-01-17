

import 'package:dementiacare/SignUp.dart';

import './music.dart';
import'./careHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import'./tasks.dart';
import './mapnav.dart';
import './userManagement.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserManagement().handleAuth(),
      routes: <String,WidgetBuilder> {
        '/landingpage': (BuildContext context) => new MyApp(),
        '/signup': (BuildContext context) => new SignUpPage(),
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int curIndex = 0;
   List <Widget> page = [
    HomePage(),
    TaskPage(),
     MyMap(),
     Music(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      curIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(curIndex);
    return new Scaffold(
      backgroundColor: Color(0xffffcdd2),
      appBar: AppBar(
          title: Text('CogniFlex'),
          backgroundColor: Color(0xff885566) ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: curIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white70,
        iconSize: 20,
        unselectedFontSize: 15,
        selectedFontSize: 20,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('Tasks'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_walk),
            title: Text('Step Out'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            title: Text('Music'),
          ),
        ],
        onTap: _onItemTapped,
      ),
      body: Center(
        child: page.elementAt(curIndex),
      ),
    );
  }
}
