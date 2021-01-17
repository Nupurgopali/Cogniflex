import 'package:dementiacare/mapnav.dart';
import 'package:dementiacare/music.dart';
import 'package:dementiacare/pulse.dart';
import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import './NewReport.dart';
import'./pulse.dart';
import './tasks.dart';
import 'careHome.dart';

class homePage extends StatefulWidget {
  homePageState createState() => homePageState();
}

class homePageState extends State<homePage> {

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
  Widget build(BuildContext context) {
    return new Scaffold(
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
      backgroundColor: Color(0xffffcdd2),


    );

  }
}
