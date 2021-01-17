import 'package:flutter/material.dart';
class Report extends StatefulWidget {
  String title;
  String report;
  String pulse;
  Report({this.title, this.report, this.pulse});
  @override
  _ReportState createState() => _ReportState();
}
class _ReportState extends State<Report> {

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFBBDEFB),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Patient Report',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'robotomono'
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
          children: [Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45.0),
                      topRight: Radius.circular(45.0),

                    ),
                    color: Colors.transparent,
                  ),
                  height: MediaQuery
                      .of(context)
                      .size
                      .height - 82.0,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                ),
                Positioned(
                    top: 75.0,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(45.0),
                              topRight: Radius.circular(45.0),
                            ),
                            color: Colors.white),
                        height: MediaQuery
                            .of(context)
                            .size
                            .height - 100.0,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width)),
                Positioned(
                  top: 30.0,
                  left: (MediaQuery
                      .of(context)
                      .size
                      .width / 2) - 95.0,
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.black,
                      fontFamily: 'robotomono',
                    ),
                  ),
                ),
                Positioned(
                    top: 100.0,
                    left: 25.0,
                    right: 25.0,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(color: Color(0XFFBBDEFB),
                              child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                  Text('-Caretaker\'s Report-',
                                      style: TextStyle(
                                          fontSize: 30.0,
                                          color: Colors.black,
                                          fontFamily: 'robotomono',
                                              ),),

                                             Text(
                                          widget.report,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.0,
                                          ),
                                        ),]
                                      ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    child:  RichText(
    text: TextSpan(
    text: 'Pulse:',
    style: TextStyle(
    color: Colors.black, fontSize: 30),
    children: <TextSpan>[
    TextSpan(text: widget.pulse,
    style: TextStyle(
    color: Colors.black, fontSize: 25),
    )
    ]
    ),
    ),
                                  ),
                          Container(
                            height: 150.0,
                            child:
                            Card(
                              child: Image.asset('assets/images/docimage.png'),

                              ),
                            ),

                                ]
                            ),
                          )
                        ]
                    )

              ]
          )
    );
  }
}