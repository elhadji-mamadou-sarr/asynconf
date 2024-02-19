
import 'package:asynconf/pages/add_event_page.dart';
import 'package:asynconf/pages/auth/auth_page.dart';
import 'package:asynconf/pages/edit_event_page.dart';
import 'package:asynconf/pages/event_pages.dart';
import 'package:asynconf/pages/login.dart';
import 'package:asynconf/pages/my_scafold.dart';
import 'package:flutter/material.dart';
import 'package:asynconf/pages/home_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// ...



void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());

}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AuthPage()
    );

  }



}
