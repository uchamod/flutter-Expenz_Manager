import 'package:expenze_manager/screens/onboard_screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Expenz manager",
      theme: ThemeData(
        fontFamily: "Poppins",
      ),
      home: OnBoardScreen(),
    );
  }
}
