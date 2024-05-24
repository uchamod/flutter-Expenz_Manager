import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
          canvasColor: const Color.fromARGB(255, 189, 145, 11)),
      home: const Scaffold(
        body: Center(
          child: Text(
            "Expenz Manager",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
