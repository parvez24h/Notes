import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



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
      body: Center(
        child: Text("Home Screen", style: TextStyle(color: Colors.black, fontSize: 25),)
      )

    );
  }
}