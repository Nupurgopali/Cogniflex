import 'package:flutter/material.dart';
import 'package:dementiacare/mapnav.dart';
import 'package:dementiacare/music.dart';
import 'package:dementiacare/pulse.dart';
import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import './NewReport.dart';
import'./pulse.dart';
import './tasks.dart';

class HomePage extends StatefulWidget {
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  final double gpsX = 60;
  final double gpsY = 80;
  double battery = 100;
  Widget batteryStatus;
  double pulse = 120;
  Widget statusAns;
  Widget pulseStat;
  String image;

  void report(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (_) {
      return GestureDetector(
        onTap: () {},
        child: NewReport(),
        behavior: HitTestBehavior.opaque,
      );
    }
    );
  }

  Widget status() {
    if (gpsX == 60 && gpsY == 60) {
      statusAns = Text(
          'At home',
          style: TextStyle(
            fontSize: 20,
            color: Colors.lightGreen,
          )
      );
      image = 'assets/images/ic_home_48px-512.png';
    }
    else {
      statusAns = FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyMap()),
            );
          },
          child: Text('Outdoors',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              )
          )

      );


      image = 'assets/images/steps.png';
    }
    return statusAns;
  }

  Widget pulseAns() {
    if (100 < pulse && pulse < 120)
      pulseStat = Text('Normal',
          style: TextStyle(
            color: Colors.lightGreen,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          )
      );
    else if (pulse < 80)
      pulseStat = Text('Low!Needs attention',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )
      );
    else
      pulseStat = FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Music()),
            );
          },
          child: Text('High! possiblity of an anxiety attack',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              )
          )

      );
    return pulseStat;
  }

  Widget charge() {
    if (battery > 80) {
      batteryStatus = Text(
          'Optimal Charge - $battery%',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          )
      );
    }
    else if (battery < 80 && battery > 40) {
      batteryStatus = Text(
          '$battery%',
          style: TextStyle(
            fontSize: 20,
            color: Colors.amber,
          )
      );
    }
    else {
      batteryStatus = Text(
          'Low battery $battery%',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          )
      );
    }
    return batteryStatus;
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xffffcdd2),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.all(Radius.circular(60.0))

                  ),
                  child: Center(
                    child: Text(
                      'Greetings!',
                      style: TextStyle(
                        fontSize: 50.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal,
                      ),
                    ),

                  )
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Color(0xffff9a9a),
                      borderRadius: BorderRadius.all(Radius.circular(60.0))

                  ),
                  child: Row(

                    children: <Widget>
                    [ Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),

                          padding: EdgeInsets.all(10),
                          child: Column(
                              children: <Widget>[
                                Text(
                                    'Where is the patient?',
                                    style: TextStyle(
                                        fontSize: 25
                                    )
                                ),
                                status(),
                              ]
                          )
                      ),
                      Expanded(
                          child: Container(
                            width: 60,
                            height: 60,
                            child: Image.asset(image),
                          )
                      )
                    ],
                  )
              ),

              Container(
                decoration: BoxDecoration(
                    color: Color(0xffff9a9a),
                    borderRadius: BorderRadius.all(Radius.circular(60.0))

                ),
                margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10)
                ,
                child:
                Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'Pulse',
                            style: TextStyle(
                              fontSize: 25,
                            ),

                          ),
                          //pulseGraph(),
                          Container(
                              padding: EdgeInsets.all(15),
                              width: double.infinity,
                              child: Center(

                                child: pulseGraph(),
                                /* Text(
                                'Graph',
                                style: TextStyle(
                                  fontSize: 80,
                                )
                            )*/
                              )
                          ),
                          pulseAns(),

                        ]
                    )
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xffff9a9a),
                    borderRadius: BorderRadius.all(Radius.circular(60.0))

                ),
                margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10),
                child: Container(
                  width: double.infinity,

                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                            'Battery Status',
                            style: TextStyle(
                              fontSize: 25,
                            )
                        ),
                        charge(),
                      ]
                  ),

                ),
              ),
              SizedBox(
                  height: 20
              ),
              Center(
                  child:
                  RaisedButton(
                    color: Colors.brown,
                    onPressed: () => report(context),
                    child: Text('Add daily Report',
                        style: TextStyle(
                            color: Colors.white
                        )),
                  )
              ),
            ]

        ),
      ),
    );
  }
}