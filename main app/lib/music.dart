import 'package:flutter/material.dart';
import'./uploadmusic.dart';
import'./musicList.dart';

class Music extends StatefulWidget {
  MusicState createState() => MusicState();
}

class MusicState extends State<Music> {
  void startAddNewMusic(BuildContext ctx)
  {
    showModalBottomSheet(context: ctx, builder: (_){
      return  GestureDetector(
        onTap: () {} ,
        child:Upload(),
        behavior: HitTestBehavior.opaque,
      );
    }
    );
  }
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: SongList(),
      floatingActionButtonLocation:  FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xff885566),
          child: Icon(Icons.add),
          onPressed: () => startAddNewMusic(context),
        ),
    );
  }
}