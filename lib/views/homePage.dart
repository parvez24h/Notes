import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes/views/addNotePage.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Notes", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("notes").snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
              if(snapshot.hasError){
                return Text("Something went wrong");
              }
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(
                  child: CupertinoActivityIndicator(),
                );
              }
              if(snapshot.data!.docs.isEmpty){
                return Text("No Data Found");
              }

              if(snapshot != null && snapshot.data != null){
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index){
                    return Card(
                      child: ListTile(title: Text(
                        "Title: "+snapshot.data!.docs[index]['title']+"\n"+
                          "Description: "+ snapshot.data!.docs[index]['description']
                      ),),
                    );
                  }
                );
              }

              return Container();

            })
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (_)=>const AddNotePage())
          );
        },
        child: Icon(Icons.add),
        tooltip: 'Add',
      ),

    );
  }
}