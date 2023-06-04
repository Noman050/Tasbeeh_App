// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../constants/colors.dart';
import '../helpers/authenticationHelper.dart';


class CreateTasbeehScreen extends StatefulWidget {
  const CreateTasbeehScreen({super.key});
  @override
  _CreateTasbeehScreenState createState() => _CreateTasbeehScreenState();
}
class _CreateTasbeehScreenState extends State<CreateTasbeehScreen> {

  TextEditingController tName = TextEditingController();
  TextEditingController tCount = TextEditingController();

  var name;
  var count;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Tasbeeh'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                cursorColor: buttonColor,
                style: const TextStyle(color: whiteColor),
                controller: tName,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                            width: 3,
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                            width: 3,
                            color: buttonColor
                        )
                    ),
                    labelText: "Name of Tasbeeh",
                    labelStyle: const TextStyle(color: whiteColor),
                ),
              ),

              const SizedBox(
                height: 40,
              ),

              TextField(
                cursorColor: buttonColor,
                style: const TextStyle(color: whiteColor),
                controller: tCount,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                            width: 3,
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                            width: 3,
                            color: buttonColor
                        )
                    ),
                    labelText: "Count Number",
                    labelStyle: const TextStyle(color: whiteColor),
                ),
              ),

              const SizedBox(
                height: 120,
              ),
              ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  minimumSize: const Size(40, 40),
                  backgroundColor: buttonColor),
              icon: const Icon(Icons.add, color: blackColor, size: 35,),
              onPressed: () {
                name=tName.text;
                count=tCount.text;
                final uid=AuthenticationHelper().getID();
                    FirebaseFirestore.instance.collection("ummati").doc(uid).collection('tasbeeh').add({'name':'$name','count':'$count','usercount':0});
                    Alert(
                      context: context,
                      type: AlertType.success,
                      title: "Created",
                      desc: "You Tasbeeh has Been Created",
                      buttons: [
                        DialogButton(
                          
                          color: buttonColor,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          width: 120,
                          child: const Text(
                            "OK",
                            style: TextStyle(color: blackColor, fontSize: 20),
                          ),
                        )
                      ],
                    ).show();
              },
              label: const Text(
                "Create",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: blackColor),
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}

