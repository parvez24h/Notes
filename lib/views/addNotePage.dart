import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final titleProvider = StateProvider<String>((ref)=>"");
final descriptionProvider = StateProvider<String>((ref)=>"");

class AddNotePage extends ConsumerStatefulWidget {
  const AddNotePage({super.key});

  @override
  ConsumerState<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends ConsumerState<AddNotePage> {

  late TextEditingController titleEditingController;
  late TextEditingController descriptionEditingController;

  @override
  void initState() {
    titleEditingController = TextEditingController();
    descriptionEditingController = TextEditingController();

    titleEditingController.addListener((){
      ref.read(titleProvider.notifier).state = titleEditingController.text;
    });
    descriptionEditingController.addListener((){
      ref.read(descriptionProvider.notifier).state = descriptionEditingController.text;
    });

    super.initState();
  }

  @override
  void dispose() {
    titleEditingController.dispose();
    descriptionEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final title = ref.watch(titleProvider);
    final description = ref.watch(descriptionProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Add Note", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        iconTheme: IconThemeData(color: Colors.white),
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
                  controller: titleEditingController,
                  enabled: true,
                  decoration: InputDecoration(
                      hintText: "Title: ",
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
                  controller: descriptionEditingController,
                  enabled: true,
                  minLines: 4,
                  maxLines: 5,
                  onChanged: (value) {
                    print("Change Text: $value");
                  },

                  decoration: InputDecoration(
                      hintText: "Description:",
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




                        FirebaseFirestore.instance.collection("notes").doc().set(
                            {
                              "title":title,
                              "description": description
                            }).then((_)=>{
                              print("added")
                        });



                        context.pop();

                      },
                      child: Text("Save", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blue),)
                  )
              ),

              Expanded(
                  flex: 1,
                  child: SizedBox(width: 20,)
              ),
            ],
          )
        ],
      ),

    );
  }
}
