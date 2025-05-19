import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/views/addNotePage.dart';
import 'package:shared_preferences/shared_preferences.dart';



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
        title: Row(
          children: [
            Expanded(flex: 1,child: Text("Notes", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topRight,
                  child: ElevatedButton(
                    onPressed: ()async{

                      var sharedPreferences = await SharedPreferences.getInstance();

                      sharedPreferences.setBool("auth", false);

                      GoRouter.of(context).go('/login');
                    },
                    child: Text("Logout", style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
            ),

          ],
        ),
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
          GoRouter.of(context).push('/add');
        },
        child: Icon(Icons.add),
        tooltip: 'Add',
      ),

    );
  }
}