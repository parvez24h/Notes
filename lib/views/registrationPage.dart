import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'homePage.dart';


class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  var nameEditingController = TextEditingController();
  var emailEditingController = TextEditingController();
  var passEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Registration", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
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
                  controller: nameEditingController,
                  enabled: true,
                  decoration: InputDecoration(
                      hintText: "Name: ",
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


                        String name = nameEditingController.text.toString();
                        String email = emailEditingController.text.toString();
                        String password = passEditingController.text.toString();

                        FirebaseFirestore.instance.collection("users").doc().set(
                            {
                              "name":name,
                              "email": email,
                              "password": password
                            }).then((_)=>{
                              print("User registered")
                            });

                        GoRouter.of(context).go('/login');

                      },
                      child: Text("Register", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blue),)
                  )
              ),

              Expanded(
                  flex: 1,
                  child: SizedBox(width: 20,)
              ),
            ],
          ),

          SizedBox(height: 20,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already register Please"),
              SizedBox(width: 10,),
              ElevatedButton(
                  onPressed: ()=>{
                    GoRouter.of(context).go('/login')
                  },
                  child: Text("Login")),
            ],
          )





        ],
      ),

    );
  }
}
