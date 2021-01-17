import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './songPage.dart';
class SongList extends StatefulWidget {
  @override
  _SongListState createState() => _SongListState();
}
class _SongListState extends State<SongList> {
  Future getdata() async {
    QuerySnapshot qn =
    await Firestore.instance.collection('songs').getDocuments();
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
    return Scaffold(backgroundColor: Color(0xffffcdd2),
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
    'Music List',
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
                  decoration: BoxDecoration(
                    color: Color(0xffff9a9a),
                      borderRadius: BorderRadius.all(Radius.circular(60.0)),

                  ),
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Songpage(
                                title:snapshot.data[index].data['song_name'],
                                url:snapshot.data[index].data['song_url'],
                                image:snapshot.data[index].data['image_url']))),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        snapshot.data[index].data['song_name'],
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),),),

                );},
          )
    );
          }
        }
        );
  }
}