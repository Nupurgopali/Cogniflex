import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewReport extends StatefulWidget {
@override
_NewReportState createState() => _NewReportState();
}

class _NewReportState extends State<NewReport> {
  TextEditingController titleController = new TextEditingController();
  StorageReference ref;
  final firestoreinstance = Firestore.instance;
  var downurl, imagedownurl;



  void finalupload() {
    var data = {
      'Report': titleController.text,
    };
    firestoreinstance.collection('patientList').document().setData(data);
  }




  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: SingleChildScrollView(
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: Column(children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                keyboardType: TextInputType.text,
                onSubmitted: (_) => finalupload(),
              ),

              RaisedButton(
                child:
                Text('Upload Report', style: Theme.of(context).textTheme.title),
                textColor: Colors.black,
                onPressed: () => finalupload(),
              )
            ])),
      ),
    );
  }
}
