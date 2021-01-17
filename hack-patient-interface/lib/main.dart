import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:music_player/music_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
import './musicList.dart';
import './TaskList.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'At Home',
        home: Builder(
            builder: (context) => Scaffold(
                  appBar: AppBar(
                    title: new Text(
                      "SoulFit",
                    ),
                    backgroundColor: Colors.deepPurple[100],
                  ),
                  body: Container(
                    child: Stack(
                      children: [
                        TaskList(),
                        Align(
                          alignment: Alignment(0.87, 0.87),
                          child: ButtonBar(
                            mainAxisSize: MainAxisSize.max,
                            alignment: MainAxisAlignment.spaceEvenly,
                            buttonHeight: 80,
                            buttonMinWidth: 100,
                            children: <Widget>[
                              RaisedButton.icon(
                                icon: Icon(Icons.add_call),
                                onPressed: () => launch("tel://9629333190"),
                                label: Text('Call'),
                                color: Colors.green[300],
                              ),
                              RaisedButton.icon(
                                onPressed: () {
                                  pushSaved(context);
                                },
                                icon: Icon(Icons.location_city),
                                label: Text('Go Out'),
                                color: Colors.green[100],
                              ),
                              RaisedButton.icon(
                                onPressed: () {
                                  pushSaved1(context);
                                },
                                icon: Icon(Icons.music_note),
                                label: Text('Refreshment'),
                                color: Colors.blue[200],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )));
  }

  void pushSaved(BuildContext context) {
    Navigator.of(context).push(
      new MaterialPageRoute(builder: (context) {
        return new Scaffold(
            appBar: new AppBar(
              title: new Text(
                "Go Out",
              ),
              backgroundColor: Colors.pink[100],
            ),
            body: Stack(children: [
              Column(),
              CalmImageAsset(),
              Align(
                  alignment: Alignment(0.0, -0.85),
                  child: Text(
                    ("Nice to see you up and about! "),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
              Align(
                alignment: Alignment(0.95, 0.95),
                child: ButtonBar(
                  mainAxisSize: MainAxisSize.max,
                  alignment: MainAxisAlignment.spaceEvenly,
                  buttonHeight: 120,
                  buttonMinWidth: 170,
                  children: <Widget>[
                    RaisedButton.icon(
                      icon: Icon(Icons.add_call),
                      onPressed: () => launch("tel://9629333190"),
                      label: Text('Call'),
                      color: Colors.green[100],
                    ),
                    RaisedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.check_circle),
                      label: Text('Tasks'),
                      color: Colors.amberAccent[100],
                    ),
                  ],
                ),
              ),
            ]));
      }),
    );
  }
}

void pushSaved1(BuildContext context) {
  Navigator.of(context).push(
    new MaterialPageRoute(builder: (context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text(
            "Favourite music!",
          ),
          backgroundColor: Colors.deepOrangeAccent[100],
        ),
        body: SongList(),
      );
    }),
  );
}

class CalmImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/video-to-gif-converter.gif');
    Image image = Image(
      image: assetImage,
    );
    return Container(
      child: image,
      alignment: Alignment.center,
    );
  }
}
