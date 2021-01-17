import './Appointment.dart';
import './PatientList.dart';
import 'package:flutter/material.dart';
import './main.dart';

class DocHomePage extends StatefulWidget {
  DocHomePageState createState() => DocHomePageState();

}

class DocHomePageState extends State<DocHomePage>{

  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Color(0XFFBBDEFB),
      body:
      ListView(
        children : <Widget>[
          SizedBox(
            height:20
          ),
          Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
          Container(
            child:
          Padding(
            padding: EdgeInsets.all(10),
            child:Text(
              'Hello Dr.Joshi!',
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontFamily:'robotomono'
              ),
            )
          ),
          ),
              Expanded(
                child:
              Container(
                height: 150.0,
                child:
                Card(
                  child: Image.asset('assets/images/head.PNG'),
                ),
              ),
              )
          ]
          ),
          SizedBox(height: 40,),
          Container(

          height: MediaQuery.of(context).size.height -195,
          child:
          Column(
              children : <Widget>[
                SizedBox(
                  height:20
                ),

            Container(
                width: double.infinity,
                height: 100 ,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(75.0)),

                ),
                child: FlatButton(
                    onPressed:() { Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PatientList()),
                    );
                    },
                    child: Text('Patient Count : 15',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontFamily: 'robotomono'
                        )
                    )
                )
            ),
            Container(
                width: double.infinity,
                height: 100 ,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(75.0)),

                ),
                child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Reports updated as on 11/06 :',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontFamily: 'robotomono'
                          )
                      ),
                      Text('10',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontFamily: 'robotomono'
                          )
                      ),
                    ]
                )
            ),
            Container(
                width: double.infinity,
                height: 100 ,
                decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(75.0)),

                ),
              child: FlatButton(
                onPressed:() { Navigator.push(
                context,MaterialPageRoute(builder: (context) => Appointment()),);
                    },
                  child: Text('Upcoming Appointments:2',
                            style: TextStyle(
                              fontSize: 25,
                                color: Colors.black,
                                fontFamily: 'robotomono'
                              )
  )
    )
            )
    ]
          )
          ),
          ]

    ),


    );


  }
}