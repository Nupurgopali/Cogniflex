import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';


class NewTask extends StatefulWidget {
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  TextEditingController titleController = new TextEditingController();
  File file;
  TimeOfDay time = TimeOfDay.now();
  TimeOfDay picked;
  String filename, imagefilepath;
  StorageReference ref;
  final firestoreinstance = Firestore.instance;
  var downurl, imagedownurl;

  Future<Null> selectTime(BuildContext context) async {
    picked = await showTimePicker(context: context, initialTime: time);
    setState(() {
      time = picked;
    });
    return null;
  }

  void selectimage() async {
    file = await FilePicker.getFile();
    setState(() {
      file = file;
      imagefilepath = basename(file.path);
      uploadImageFile(file.readAsBytesSync(), imagefilepath);
    });
  }

  Future<String> uploadImageFile(
      List<int> imagefile, String imagefilename) async {
    ref = FirebaseStorage.instance.ref().child(imagefilename);
    StorageUploadTask uploadTask = ref.putData(imagefile);
    imagedownurl = await (await uploadTask.onComplete).ref.getDownloadURL();
    return 'success';
  }

  void finalupload() {
    var data = {
      'Title': titleController.text,
      'image_url': imagedownurl.toString(),
      'Time': time.toString(),
    };
    firestoreinstance.collection('tasks').document().setData(data);
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
              Center(
                child: Row(
                  children: [
                    IconButton(
                      iconSize: 40,
                      icon: Icon(Icons.image),
                      tooltip: 'Select an image',
                      onPressed: () => selectimage(),
                    ),
                    IconButton(
                      iconSize: 40,
                      icon: Icon(Icons.alarm),
                      tooltip: 'Set Time',
                      onPressed: () => selectTime(context),
                    ),
                  ],
                ),
              ),
              RaisedButton(
                child:
                    Text('Add Task', style: Theme.of(context).textTheme.title),
                textColor: Colors.black,
                onPressed: () => finalupload(),
              )
            ])),
      ),
    );
  }
}
