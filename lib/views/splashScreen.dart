import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes/views/homePage.dart';
import 'package:notes/views/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{

  var mAuth = false;
  @override
  void initState() {
    super.initState();

    getData();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Future.delayed(const Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_)=>mAuth?const HomePage():const HomePage())
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.pink],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft
          ),


        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Note App", style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }

  void getData() async{
    var sharedPreferences = await SharedPreferences.getInstance();
    var isLogin = sharedPreferences.getBool("auth");
    mAuth = (isLogin!=null && isLogin)?true:false;
  }
}
