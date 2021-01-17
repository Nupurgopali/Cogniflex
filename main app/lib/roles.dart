import 'package:dementiacare/userManagement.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './userManagement.dart';

class HomePage extends StatefulWidget {
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  Widget build(BuildContext context){
    return new Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child:Column(
               children:[ Container(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(),
                    child: Ink.image(
                      image: AssetImage(
                          'assets/images/doctor.png'),
                      fit: BoxFit.fill,
                      child: InkWell(
                        onTap: () {
                          UserManagement().authorizeAccess(context);
                        }
                      ),
                    ),
                  ),
                ),
                 Container(
                   child: Text('Doctor')
                 )
                ]
            )
            ,
          ),
          SizedBox(height: 15,),
          Expanded(
            child:Column(
                children:[ Container(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(),
                    child: Ink.image(
                      image: AssetImage(
                          'assets/images/caretaker.jpg'),
                      fit: BoxFit.fill,
                      child: InkWell(
                        onTap: () {
                          UserManagement().authorizeAccess(context);
                        }
                      ),
                    ),
                  ),
                ),
                  Container(
                      child: Text('Caretaker')
                  )
                ]
            )
            ,
          ),
          SizedBox(height: 15,),
          Expanded(
            child:Column(
                children:[ Container(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(),
                    child: Ink.image(
                      image: AssetImage(
                          'assets/images/patient.png'),
                      fit: BoxFit.fill,
                      child: InkWell(
                        onTap:() {
                          UserManagement().authorizeAccess(context);
                        }

                      ),
                    ),
                  ),
                ),
                  Container(
                      child: Text('Patient')
                  )
                ]
            )
            ,
          ),
          SizedBox(height: 15,),
        ],
      )
    );
  }
}