// ignore_for_file: library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tasbeeh_app/screens/tasbeehScreen.dart';

import '../constants/colors.dart';
import '../helpers/authenticationHelper.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});
  @override
  _CounterScreenState createState() => _CounterScreenState();
}
class _CounterScreenState extends State<CounterScreen> {

  var name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasbeehs to Perform'),
      ),
      body:
      StreamBuilder(
        stream: FirebaseFirestore.instance.collection('ummati').doc(AuthenticationHelper().getID()).collection('tasbeeh').snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, int index) {
                return Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                  child: CardList(snapshot: snapshot.data,index: index),
                );
              });
        },
      ),

    );

  }

}
class CardList extends StatelessWidget {

  const CardList({super.key, required this.snapshot,required this.index});
  final QuerySnapshot snapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    var docid=snapshot.docs[index].id;
    var data=snapshot.docs[index]['count'];
    var usercount=snapshot.docs[index]['usercount'];
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TasbeehScreen(countt: data,usercount:usercount,docid:docid)));
      },
      child: Container(
          height: 70,
          decoration: const BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                        Row(
                          children: [
                            const SizedBox(
                              // changing from 200 to 150 as to look better
                              height: 50.0,
                              width: 50.0,
                              child: ClipOval(
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/images/tasbeeh1.png',
                                  ),
                                ),
                              ),
                            ),

                            Text(
                              snapshot.docs[index]['name'],
                              style:
                              const TextStyle(fontSize: 25, color: bgColor, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                    Row(
                      children: [

                        Container(
                          width:20,
                        ),
                       Column(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           const Text(
                             'Total Count',
                             style:
                             TextStyle(fontSize: 15, color: redColor, fontWeight: FontWeight.bold),
                           ),
                           Text(
                             snapshot.docs[index]['count'],
                             style:
                             const TextStyle(fontSize: 20, color: blackColor, fontWeight: FontWeight.bold),
                           ),
                         ],
                       ),
                        Container(
                          width:15,
                        ),

                      ],
                    )
                  ]))),
    );
  }
}

