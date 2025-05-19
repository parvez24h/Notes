import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/views/homePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var emailEditingController = TextEditingController();
  var passEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          backgroundColor: Colors.pink,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [


            SizedBox(height: 20,),

            Row(
              children: [
                SizedBox(width: 20,),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: emailEditingController,
                    enabled: true,
                    decoration: InputDecoration(
                        hintText: "Email: ",
                        prefixStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.blue
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.blue
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.black
                            )
                        ),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.yellow
                            )
                        )
                    ),
                  ),
                ),
                SizedBox(width: 20,)
              ],
            ),

            SizedBox(height: 20,),

            Row(
              children: [
                SizedBox(width: 20,),
                Expanded(
                  child: TextField(
                    controller: passEditingController,
                    enabled: true,
                    obscureText: true,
                    onChanged: (value) {
                      print("Change Text: $value");
                    },

                    decoration: InputDecoration(
                        hintText: "Password:",
                        prefixStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.blue
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.blue
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.black
                            )
                        ),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.pink
                            )
                        )
                    ),
                  ),
                ),
                SizedBox(width: 20,)
              ],
            ),

            SizedBox(height: 20,),

            Row(
              children: [

                Expanded(
                    flex: 1,
                    child: SizedBox(width: 20,)
                ),
                Expanded(
                    flex: 2,
                    child: ElevatedButton(
                        onPressed: () async{


                          String email = emailEditingController.text.toString();
                          String pass = passEditingController.text.toString();

                          print(email);
                          print(pass);

                          var query = await FirebaseFirestore.instance.collection("users")
                          .where('email', isEqualTo: email)
                          .limit(1).get();

                          if(query.docs.isNotEmpty){
                            var sharedPreferences = await SharedPreferences.getInstance();

                            sharedPreferences.setBool("auth", true);


                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const HomePage()));
                          }

                        },
                        child: Text("Login", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blue),)
                    )
                ),

                Expanded(
                    flex: 1,
                    child: SizedBox(width: 20,)
                ),
              ],
            ),

            SizedBox(height: 20,),

            Text("Don't have an account? Register")




          ],
        ),

    );
  }
}
