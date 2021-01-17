import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart' ;
import 'package:path/path.dart' ;
import 'package:flutter/material.dart' ;
import 'package:file_picker/file_picker.dart' ;


class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  TextEditingController songnameController=TextEditingController();
  File file,image;
  String filename,imagefilepath;
  StorageReference ref;
  final  firestoreinstance = Firestore.instance;
  var downurl,imagedownurl;
  void selectimage() async{
    image=await FilePicker.getFile();
    setState(() {
      image=image;
      imagefilepath=basename(image.path);
      uploadImageFile(image.readAsBytesSync(),imagefilepath);
    });
  }
  Future<String> uploadImageFile(List<int> imagefile,String imagefilename) async{
    ref=FirebaseStorage.instance.ref().child(imagefilename);
    StorageUploadTask uploadTask=ref.putData(imagefile);
    imagedownurl=await (await uploadTask.onComplete).ref.getDownloadURL();
    return 'success';
  }
  void selectfile() async{
    file = await FilePicker.getFile();
    setState(() {
      file=file;
      filename=basename(file.path);
    });
    uploadSongFile(file.readAsBytesSync(),filename);
  }
  Future<String> uploadSongFile(List<int> file,String filename) async{
    ref=FirebaseStorage.instance.ref().child(filename);
    StorageUploadTask uploadTask = ref.putData(file);
    downurl=await (await uploadTask.onComplete).ref.getDownloadURL();
    return 'success';
  }
  void finalupload(){
    var data = {
    'song_name':songnameController.text,
    'song_url':downurl.toString(),
    'image_url':imagedownurl.toString(),
    };
    firestoreinstance.collection('songs').document().setData(data);
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation:20,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child:Column(
          children: <Widget>[
            Center(
              child: Row(children: [
              IconButton(
                icon: Icon(Icons.music_note),
                iconSize: 40,
                tooltip: 'Select Song',
                onPressed: ()=>selectfile(),
              ),IconButton(
                  iconSize: 40,
                icon: Icon(Icons.image),
                tooltip: 'Select an image',
                onPressed: ()=>selectimage(),
              ),
            ],
            ),
            ),
            Padding(
              padding:EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child:TextField(
                controller: songnameController,
                decoration: InputDecoration(
                    hintText: 'Enter the name of Song'
                ),
              ),
            ),
            RaisedButton(
              onPressed: (){
                finalupload();
              },
              child: Text('Submit'),
            )
          ],

        )
      )


      );

  }
}