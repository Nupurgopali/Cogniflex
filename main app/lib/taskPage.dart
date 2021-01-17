import 'package:flutter/material.dart';
class Taskpage extends StatefulWidget {
  String title;
  String time;
  String image;
  Taskpage({this.title, this.time, this.image});
  @override
  _TaskpageState createState() => _TaskpageState();
}
class _TaskpageState extends State<Taskpage> {

  //TimeOfDay _startTime = TimeOfDay(hour:int.parse(time.split(":")[0]),minute: int.parse(time.split(":")[1]));

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffcdd2),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),

              SizedBox(
                height: 30.0,
                child: Text(
                  widget.time,
                ),
              ),

              Card(
                child: Image.network(
                  widget.image,
                  height: 350.0,
                ),
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 100.0,
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                        },
                        child:Text(
                        'Go Back',
                        style: TextStyle(
                          fontSize: 30.0,
                        )
                    )
                        ),
                  ),
                  SizedBox(
                    width: 100.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}