// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'azaanScreen.dart';
import 'tasbeehHomrScreen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: IconButton(icon: const Icon(Icons.handyman, color: buttonColor,), onPressed: (){ Navigator.pop(context); },),
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 120,),
            InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const TasbeehScreen()));
              },
              child: Material(
                color: buttonColor,
                elevation: 50.0,
                borderRadius: BorderRadius.circular(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  width: 335,
                  height: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Center(
                        child: Text(
                          'Tasbeeh',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: blackColor,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                        ),
                        child: Material(
                          elevation: 4.0,
                          borderRadius: BorderRadius.circular(15.0),
                          child: const SizedBox(
                            height: 80.0,
                            width: 80.0,
                            child: ClipOval(
                              child: Image(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/images/tasbeeh1.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AzaanScreen()));
              },
              child: Material(
                color: buttonColor,
                elevation: 50.0,
                borderRadius: BorderRadius.circular(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  width: 335,
                  height: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Center(
                        child: Text(
                          'Azaan',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: blackColor,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                        ),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(15.0),
                          child: const SizedBox(
                            // changing from 200 to 150 as to look better
                            height: 80.0,
                            width: 80.0,
                            child: ClipOval(
                              child: Image(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/images/mosque.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 300,),
            const Center(
              child: Text('Developed by Noman Ali (FA19-BSE-050)',style: TextStyle(fontSize: 15, color: whiteColor, letterSpacing: 1, fontWeight: FontWeight.bold),),
            )
          ],
        ),
      ),
    );
  }
}