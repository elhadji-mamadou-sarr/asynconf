
import 'package:flutter/material.dart';
import 'package:asynconf/pages/home_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Asyncof",
            style: TextStyle(
                fontFamily: "Poppins",
                color: Colors.white
            ),
          ),
          backgroundColor: Color(0xFF008890),
        ),
        body: HomePage(),
      ),
    );
  }
}