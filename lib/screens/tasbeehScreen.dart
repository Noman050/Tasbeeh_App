// ignore_for_file: library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tasbeeh_app/constants/colors.dart';

import 'homeScreen.dart';

class TasbeehScreen extends StatefulWidget {
  const TasbeehScreen({required this.countt,required this.usercount,required this.docid,Key? key}) : super(key: key);
  final countt;
  final usercount;
  final docid;


  @override
  _TasbeehScreenState createState() => _TasbeehScreenState();
}

class _TasbeehScreenState extends State<TasbeehScreen> {

  var s=FirebaseFirestore.instance.collection('tasbeeh').snapshots();
  late int counttt=int.parse(widget.countt);
  late var usercountt=widget.usercount;
  late var docidd=widget.docid;
  late int num = rem;
  late int counter=usercountt;
  late int rem=counttt-counter;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Count Tasbeeh'),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/tasbeehh.png"),
                      fit: BoxFit.fitWidth
                  )
              ),
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 110,
                            height:40,
                            child:  ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(buttonColor),

                                    shape:MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(32.0),
                                        )
                                    )
                                ),
                                onPressed: () {
                                },
                                child: Text("Total: ${widget.countt}",style: const TextStyle(color: blackColor,fontSize: 20, fontWeight: FontWeight.bold),)),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 110,
                            height: 40,
                            child:  ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(buttonColor),

                                    shape:MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(32.0),
                                        )
                                    )
                                ),
                                onPressed: () {
                                },
                                child: Text("Left: $rem",style: const TextStyle(color: blackColor,fontSize: 20, fontWeight: FontWeight.bold),)),
                          ),
                        ],
                      ),
                    ],),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.black54),

                          shape:MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              )
                          )
                      ),
                      onPressed: () {
                      },
                      child: Text("$counter",style: const TextStyle(color: Colors.white,fontSize: 25),)),
                  const SizedBox(
                    height:30,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        if(rem>0)
                        {
                          counter++;
                          rem--;
                          FirebaseFirestore.instance.collection("tasbeeh").doc(docidd).update({
                            'usercount':counter});
                        }
                        else
                        {
                          counter=counter;
                          rem=0;
                          FirebaseFirestore.instance.collection("tasbeeh").doc(docidd).update({
                            'usercount':counter});
                          Alert(
                            context: context,
                            type: AlertType.success,

                            title: "Finished",
                            desc: "You have Completed the Tasbeeh",
                            buttons: [
                              DialogButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => const HomeScreen()));
                                },
                                width: 120,
                                child: const Text(
                                  "OK",
                                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                                ),

                              )
                            ],
                          ).show();
                        }
                      });
                    },
                    child: const CircleAvatar(
                      radius: 32.0,
                      backgroundImage: AssetImage('assets/images/button.png'),
                    ),
                  ),
                  ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0)),
                  minimumSize: const Size(40, 40),
                  backgroundColor: buttonColor),
                  icon: const Icon(Icons.restore, color: blackColor, size: 35,),
                  onPressed: () {
                          setState(() {
                           counter=0;
                           rem=counttt-counter;
                         });
                  FirebaseFirestore.instance.collection("tasbeeh").doc(docidd).update({
                  'usercount':counter});
                  },
                 label: const Text(
                "Reset",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: blackColor),
                ),
                 ),
                ],
              ),
            )
        ),
      ),
    );
  }
}


