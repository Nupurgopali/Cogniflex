import 'package:flutter/material.dart';
import './taskPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  Future getdata() async {
    QuerySnapshot qn =
        await Firestore.instance.collection('tasks').getDocuments();
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
                backgroundColor: Color(0xffffcdd2),
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
                  'Task List',
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
                            builder: (context) => Taskpage(
                                title: snapshot.data[index].data['Title'],
                                time: snapshot.data[index].data['Time'],
                                image: snapshot.data[index].data['image_url']))),
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
                          fontSize: 20.0,
                        ),
                      ),
                     Text(
                        (snapshot.data[index].data['Time'].toString()),
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
