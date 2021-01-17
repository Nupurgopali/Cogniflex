import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget{
  @override
  MyAppState createState() => new MyAppState();
}

enum MyDialogAction{
  cancel,
  call,
}

class MyAppState extends State<MyApp> {
  String _text = '';

  void _onChange(String value) {
    setState(() {
      _text = value;
    });
  }

  void _showAlert(String value) {
    if (value.isEmpty) return;

    AlertDialog dialog = new AlertDialog(
      content: new Text("Ram has crossed the geofence! Unfamiliar zone detected",
        style: new TextStyle(fontSize: 30.0),

      ),
      actions: <Widget>[
        new FlatButton(onPressed: (){}, child: new Text('cancel')),
        new FlatButton(onPressed: (){}, child: new Text('Call patient',
        style: new TextStyle(color: Colors.red)
        ))
      ],
    );
    showDialog(context: context, child: dialog);
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor:Colors.red,
          title: new Text('Cogniflex'),
        ),
        body: new Container(
            child: new Center(
                child: new Column(
                    children: <Widget>[
                      new TextField(onChanged: (String value) {
                        _onChange(value);

                      }),
                      new RaisedButton(
                        onPressed: () {
                          _showAlert(_text);
                        },
                        child: new Text('Current Location'),
                      ),
                    ]
                )
            )
        )
    );
  }
}