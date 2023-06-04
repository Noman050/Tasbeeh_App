// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'counterScreen.dart';
import 'createTasbeehScreen.dart';
import 'listTasbeehScreen.dart';

class TasbeehScreen extends StatelessWidget {
  const TasbeehScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgDarkColor,
        drawer: IconButton(icon: const Icon(Icons.handyman, color: buttonColor,), onPressed: (){ Navigator.pop(context);},),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: buttonColor),
          backgroundColor: bgColor,
          title: const Text('Tasbeeh Screen'),
        ),
        body: GridView.count(
          crossAxisCount: 1,
          padding: const EdgeInsets.all(20.0),
          childAspectRatio: 3,
          children: [
            const SizedBox(height: 60,),
            _buildActionCard(
              context,
              'Create Tasbeeh',
              'assets/images/tasbeehh.png',
              Colors.teal,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateTasbeehScreen(),
                ),
              ),
            ),
      
            _buildActionCard(
              context,
              'Counter Tasbeeh',
              'assets/images/tasbeeh1.png',
              Colors.blue,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CounterScreen(),
                ),
              ),
            ),
            _buildActionCard(
              context,
              'View All Tasbeeh',
              'assets/images/tasbeeh2.png',
              Colors.red,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ListTasbeehScreen(),
                ),
              ),
            ),
          ],
        ),
    );
  }
  Widget _buildActionCard(
    BuildContext context,
    String title,
    String imagePath,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 80.0,
              width: 80.0,
            ),
            const SizedBox(height: 10.0),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
