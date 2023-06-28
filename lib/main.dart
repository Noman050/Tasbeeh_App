import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tasbeeh_app/screens/azaanScreen.dart';

import 'constants/colors.dart';
import 'screens/loginScreen.dart';
import 'widgets/myThemeData.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
       MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const TasbeehApp(),
          theme: myThemeData(),

      )
  );
}
class TasbeehApp extends StatelessWidget {
  const TasbeehApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body:
          SplashScreenView(
            navigateRoute:  AzaanScreen(),
            duration: 4000,
            imageSize: 200,
            imageSrc: "assets/images/tasbeeh1.png",
            backgroundColor: bgColor,
            text: 'Lets Pray Together',textStyle:const TextStyle(fontSize: 30,color: whiteColor, fontWeight: FontWeight.bold),
          ),
    );
  }
}