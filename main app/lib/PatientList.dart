import './main.dart';
import 'package:flutter/material.dart';
import'./Report.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PatientList extends StatefulWidget {
  @override
  _PatientListState createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  Future getdata() async {
    QuerySnapshot qn =
    await Firestore.instance.collection('patientList').getDocuments();
    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getdata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Scaffold(
              backgroundColor: Color(0XFFBBDEFB),
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
          'Patient List',
          style: TextStyle(
          color: Colors.black,
          fontFamily: 'robotomono'
          ),
          ),
          centerTitle: true,
          ),
              body:
              ListView.builder(

              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  height: 100 ,
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(75.0)),

                  ),
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Report(
                                title: snapshot.data[index].data['Title'],
                                pulse: snapshot.data[index].data['Pulse'],
                                report: snapshot.data[index].data['Report']))),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child:
                      //Expanded(child:
                      Row
                        ( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:<Widget>[
                            Text(
                              snapshot.data[index].data['Title'],
                              style: TextStyle(
                                fontSize: 30.0,
                              ),
                            ),
                          ]
                      ),
                      //)
                    ),
                  ),
                );
              },
            )
            );
          }
        });
  }
}