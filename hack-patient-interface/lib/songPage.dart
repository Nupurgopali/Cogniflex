import 'package:flutter/material.dart';
import 'package:music_player/music_player.dart';

class Songpage extends StatefulWidget {
  String artist;
  String title;
  String url;
  String image;
  Songpage({this.title, this.artist, this.url, this.image});
  @override
  _SongpageState createState() => _SongpageState();
}

class _SongpageState extends State<Songpage> {
  MusicPlayer musicPlayer;
  bool isplaying = false;
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  initPlatformState() {
    musicPlayer = MusicPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Card(
                child: Image.network(
                  widget.image,
                  height: 350.0,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 100.0,
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          isplaying = true;
                        });
                        musicPlayer.play(
                          MusicItem(
                            trackName: '',
                            albumName: '',
                            artistName: '',
                            url: widget.url,
                            coverUrl: '',
                            duration: Duration(seconds: 255),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.play_arrow,
                        size: 50.0,
                        color: isplaying == true ? Colors.blue : Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          isplaying = false;
                        });
                        musicPlayer.stop();
                      },
                      child: Icon(
                        Icons.stop,
                        size: 50.0,
                        color: isplaying == true ? Colors.black : Colors.blue,
                      ),
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
