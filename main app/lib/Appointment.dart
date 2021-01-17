import 'package:flutter/material.dart';

class Appointment extends StatefulWidget {
AppointmentState createState() => AppointmentState();

}

class AppointmentState extends State<Appointment> {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Appointments',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'robotomono'
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0XFFBBDEFB),
      body:
      ListView(
          children: <Widget>[


            SizedBox(
              height: 25,
            ),
            Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Upcoming Appointments',
                  style: TextStyle(
                      fontSize: 50,
                      color: Colors.black,
                      fontFamily: 'robotomono'
                  ),
                )
            ),
            SizedBox(height: 40,),
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height - 185,
              child:
              Column(children: <Widget>[

                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(75.0)),

                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            child: Text('Ms. Clarke',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                  fontFamily: 'robotomono'
                              ),
                            )

                        ),
                        Container(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                            Text('10/28/2020',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontFamily: 'robotomono'
                              ),
                            ),
                            Text('16:30',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontFamily: 'robotomono'
                              ),
                            )
                          ]
                          ),
                        ),
                      ]
                  ),
                ),
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(75.0)),

                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            child: Text('Mr. Kapoor',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                  fontFamily: 'robotomono'
                              ),
                            )

                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                            Text('10/29/2020',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontFamily: 'robotomono'
                              ),
                            ),
                            Text('17:30',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontFamily: 'robotomono'
                              ),
                            )
                          ]
                          ),
                        ),
                      ]
                  ),

                )
              ]
              ),
            ),
          ]
      ),
    );
  }
}