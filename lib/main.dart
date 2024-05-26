import 'package:expenze_manager/screens/onboard_screens.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //bind the shared preferences to flutter application
  await SharedPreferences.getInstance(); //create a instance
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
