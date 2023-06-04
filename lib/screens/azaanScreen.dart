// ignore_for_file: file_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants/colors.dart';


class AzaanScreen extends StatefulWidget {
  const AzaanScreen({Key? key}) : super(key: key);

  @override
  State<AzaanScreen> createState() => _AzaanScreenState();
}

class _AzaanScreenState extends State<AzaanScreen> {
   String _timeString='0';

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
  }

  void _getTime() {
    final String formattedDateTime =
    DateFormat('kk:mm:ss').format(DateTime.now()).toString();
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  bool fajr = false;
  bool zuhr = false;
  bool asar = false;
  bool magrib = false;
  bool esha = false;

  var textValue = 'Switch is OFF';

  void fajrswitch(bool value) {

    if(fajr == false)
    {
      setState(() {
        fajr = true;
        textValue = 'Switch Button is ON';
      });
    }
    else
    {
      setState(() {
        fajr = false;
        textValue = 'Switch Button is OFF';
      });
    }
  }
  void zuhrswitch(bool value) {

    if(zuhr == false)
    {
      setState(() {
        zuhr = true;
        textValue = 'Switch Button is ON';
      });
    }
    else
    {
      setState(() {
        zuhr = false;
        textValue = 'Switch Button is OFF';
      });
    }
  }
  void asarswitch(bool value) {

    if(asar == false)
    {
      setState(() {
        asar = true;
        textValue = 'Switch Button is ON';
      });
    }
    else
    {
      setState(() {
        asar = false;
        textValue = 'Switch Button is OFF';
      });
    }
  }
  void magribswitch(bool value) {

    if(magrib == false)
    {
      setState(() {
        magrib = true;
        textValue = 'Switch Button is ON';
      });
    }
    else
    {
      setState(() {
        magrib = false;
        textValue = 'Switch Button is OFF';
      });
    }
  }
  void eshaswitch(bool value) {

    if(esha == false)
    {
      setState(() {
        esha = true;
        textValue = 'Switch Button is ON';
      });
    }
    else
    {
      setState(() {
        esha = false;
        textValue = 'Switch Button is OFF';
      });
    }
  }

  TimeOfDay fajrtime = const TimeOfDay(hour: 0, minute: 0);
  TimeOfDay zuhrtime = const TimeOfDay(hour: 0, minute: 0);
  TimeOfDay asartime = const TimeOfDay(hour: 0, minute: 0);
  TimeOfDay magribtime = const TimeOfDay(hour: 0, minute: 0);
  TimeOfDay eshatime = const TimeOfDay(hour: 0, minute: 0);

  void _selectfajrTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: fajrtime,
    );
    if (newTime != null) {
      setState(() {
        fajrtime = newTime;
      });
    }
  }
  void _selectzuhrTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: zuhrtime,
    );
    if (newTime != null) {
      setState(() {
        zuhrtime = newTime;
      });
    }
  }
  void _selectasarTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: asartime,
    );
    if (newTime != null) {
      setState(() {
        asartime = newTime;
      });
    }
  }

  void _selectmagribTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: magribtime,
    );
    if (newTime != null) {
      setState(() {
        magribtime = newTime;
      });
    }
  }
  void _selecteshaTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: eshatime,
    );
    if (newTime != null) {
      setState(() {
        eshatime = newTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prayer Alarm'),
      ),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: const [
               Center(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30.0,
                    backgroundImage: AssetImage('assets/images/mosque.png'),
                  ),

                ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Column(
            children: [
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
                  onPressed: (){},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Time : ',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: blackColor
                            ),
                          ),
                          Text(
                            _timeString.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: bgColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),),
                side: BorderSide(width: 4, color: whiteColor)),
            elevation: 50,
            shadowColor: white30Color,
            color: buttonColor,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: const [
                      Text('Fajar', style: TextStyle(
                        fontSize: 20,
                        color: blackColor,
                        fontWeight: FontWeight.w600,
                      ),),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
                        onPressed: _selectfajrTime,
                        child: Text(' ${fajrtime.format(context)}' ,style: const TextStyle(color: blackColor, fontWeight: FontWeight.bold),),
                      ),

                    ],
                  ),
                  Switch(
                    onChanged: fajrswitch,
                    value: fajr,
                    activeColor: blackColor,
                    activeTrackColor:bgColor,
                    inactiveThumbColor: Colors.white54,
                    inactiveTrackColor: Colors.black12,
                  )
                ],
              ), //Column
            ), //SizedBox
          ),
          Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),),
                side: BorderSide(width: 4, color: whiteColor)),
            elevation: 50,
            shadowColor: white30Color,
            color: buttonColor,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: const [
                      Text('Zuhar', style: TextStyle(
                        fontSize: 20,
                        color: blackColor,
                        fontWeight: FontWeight.w600,
                      ),),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
                        onPressed: _selectzuhrTime,
                        child: Text(' ${zuhrtime.format(context)}',style: const TextStyle(color: blackColor, fontWeight: FontWeight.bold)),
                      ),

                    ],
                  ),
                  Switch(
                    onChanged: zuhrswitch,
                    value: zuhr,
                    activeColor: blackColor,
                    activeTrackColor:bgColor,
                    inactiveThumbColor: Colors.white54,
                    inactiveTrackColor: Colors.black12,
                  )

                ],
              ), //Column
            ), //SizedBox
          ),
          Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),),
                side: BorderSide(width: 4, color: whiteColor)),
            elevation: 50,
            shadowColor: white30Color,
            color: buttonColor,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: const [
                      Text('Asar', style: TextStyle(
                        fontSize: 20,
                        color: blackColor,
                        fontWeight: FontWeight.w600,
                      ),),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
                        onPressed: _selectasarTime,
                        child: Text(' ${asartime.format(context)}',style: const TextStyle(color: blackColor, fontWeight: FontWeight.bold)),
                      ),

                    ],
                  ),
                  Switch(
                    onChanged: asarswitch,
                    value: asar,
                    activeColor: blackColor,
                    activeTrackColor:bgColor,
                    inactiveThumbColor: Colors.white54,
                    inactiveTrackColor: Colors.black12,
                  )

                ],
              ), //Column
            ), //SizedBox
          ),
          Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),),
                side: BorderSide(width: 3, color: whiteColor)),
            elevation: 50,
            shadowColor: white30Color,
            color: buttonColor,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: const [
                      Text('Magrib', style: TextStyle(
                        fontSize: 20,
                        color: blackColor,
                        fontWeight: FontWeight.w600,
                      ),),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
                        onPressed: _selectmagribTime,
                        child: Text(' ${magribtime.format(context)}', style: const TextStyle(color: blackColor, fontWeight: FontWeight.bold)),
                      ),

                    ],
                  ),
                  Switch(
                    onChanged: magribswitch,
                    value: magrib,
                   activeColor: blackColor,
                    activeTrackColor:bgColor,
                    inactiveThumbColor: Colors.white54,
                    inactiveTrackColor: Colors.black12,
                  )

                ],
              ), //Column
            ), //SizedBox
          ),
          Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),),
                side: BorderSide(width: 3, color:whiteColor)),
            elevation: 50,
            shadowColor: white30Color,
            color: buttonColor,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: const [
                      Text('Esha', style: TextStyle(
                        fontSize: 20,
                        color: blackColor,
                        fontWeight: FontWeight.w600,
                      ),),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
                        onPressed: _selecteshaTime,
                        child: Text(' ${eshatime.format(context)}',style: const TextStyle(color: blackColor, fontWeight: FontWeight.bold)),
                      ),

                    ],
                  ),
                  Switch(
                    onChanged: eshaswitch,
                    value: esha,
                    activeColor: blackColor,
                    activeTrackColor:bgColor,
                    inactiveThumbColor: Colors.white54,
                    inactiveTrackColor: Colors.black12,
                  )

                ],
              ), //Column
            ), //SizedBox
          ),
          const SizedBox(height:50,),
        ],
      ),
    );
  }
}
