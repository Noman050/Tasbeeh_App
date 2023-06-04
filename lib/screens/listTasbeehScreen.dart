// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/colors.dart';
import '../helpers/authenticationHelper.dart';

class ListTasbeehScreen extends StatefulWidget {
  const ListTasbeehScreen({super.key});

  @override
  _ListTasbeehScreenState createState() => _ListTasbeehScreenState();
}

class _ListTasbeehScreenState extends State<ListTasbeehScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Created Tasbeehs'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('ummati').doc(AuthenticationHelper().getID()).collection('tasbeeh').snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
            child: CircularProgressIndicator(),);
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
class CardList extends StatefulWidget {

  const CardList({super.key, required this.snapshot,required this.index});
  final QuerySnapshot snapshot;
  final int index;

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  @override
  Widget build(BuildContext context) {
    var docid=widget.snapshot.docs[widget.index].id;
    TextEditingController updatee = TextEditingController();
    return Container(
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
                             'assets/images/tasbeehh.png',
                           ),
                         ),
                       ),
                     ),

                     Text(
                       widget.snapshot.docs[widget.index]['name'],
                       style:
                       const TextStyle(fontSize: 25, color: bgColor, fontWeight: FontWeight.bold),
                     ),
                   ],
                 ),
                 Row(
                   children: [
                     IconButton(
                       onPressed: () {
                        setState(() {
                         showDialog(context: context, builder: (context) =>  AlertDialog(
                          backgroundColor: bgColor,
                          title:  const Text("Are you sure you want to delete this ??", style: TextStyle(color: whiteColor),),
                          actions: [
                            ElevatedButton( 
                              style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
                              onPressed: (){ 
                              setState(() {
                                var ref = FirebaseFirestore.instance.collection("tasbeeh").doc(docid);
                                 ref.delete();
                              });
                               Navigator.pop(context);
                              }, 
                              child:  const Text('OK', style: TextStyle(color: blackColor))),
                              ElevatedButton( 
                              style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
                              onPressed: (){ 
                              Navigator.pop(context);
                              }, 
                              child:  const Text('Cancel', style: TextStyle(color: blackColor))),
                          ],
                         ));
                        });
                       },
                       icon: const Icon(FontAwesomeIcons.trashCanArrowUp),
                       color: redColor,
                     ),
                     IconButton(
                       onPressed:
                           () {
                          showDialog(context: context, builder: (context)=> AlertDialog(
                            backgroundColor: bgColor,
                           title: const Text('New Name ?', style: TextStyle(color: whiteColor)),
                           content: TextField(
                             cursorColor: buttonColor,
                             style: const TextStyle(color: whiteColor),
                             controller: updatee,
                             textInputAction: TextInputAction.go,
                             decoration: const InputDecoration(hintText: "Enter New Name", hintStyle: TextStyle(color: whiteColor)),
                           ),
                           actions: [
                             ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
                               child: const Text('OK', style: TextStyle(color: blackColor),),
                               onPressed: () {
                                 setState(() {
                                   FirebaseFirestore.instance.collection("tasbeeh").doc(docid).update({
                                   'name': updatee.toString(),
                                 });
                                 Navigator.of(context).pop();
                                 });
                               },
                             ),
                           ],
                         ));
                       },
                       icon: const Icon(FontAwesomeIcons.penToSquare),
                       color: blackColor,
                     ),
                   ],
                 ),
                ])));
  }
}
