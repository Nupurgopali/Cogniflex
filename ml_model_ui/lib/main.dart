import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(
    home: new HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<String> getData(String longitude,String latitude) async{
    var response = await http.post(
      Uri.encodeFull("http://192.168.121.1:5000/predict"),
      body:{
    "longitude":"151.234",
    "latitude":"234.231"
    }
    );
    if(response.statusCode == 201){
      final String responseString = response.body;
      print(responseString);
    }
    return "Success";
  }
  TextEditingController longitudeController = TextEditingController();
  TextEditingController latitudeController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
            backgroundColor:Colors.red,
          title: Text('Location Determiner '),
        ),
        body: Padding(

            padding: EdgeInsets.all(10),

            child: ListView(
              children: [
                Column(
                  children: <Widget>[
                    TextField(
                    controller: longitudeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'longitude',
                    ),
                  ),
                    TextField(
                    controller: latitudeController,
                    decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'latitude',
                  ),
                ),
              ],
                ),

                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.red,
                      child: Text('Get Data'),
                      onPressed: () {
                        final String longitude = longitudeController.text;
                        final String latitude = latitudeController.text;
                        getData(longitude,latitude);
                      },
                    )),
              ],
            )));
  }
  }