import 'package:flutter/material.dart';
import'./PatientList.dart';
import './DocHome.dart';
import './Appointment.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int curIndex = 0;
  List <Widget> page = [
    DocHomePage(),
    PatientList(),
    Appointment(),
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
      backgroundColor: Color(0XFF21BFBD),
      appBar: AppBar(
          title: Text('SoulFit')),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: curIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white54,
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
            title: Text('Patient List'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            title: Text('Appointments'),
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
