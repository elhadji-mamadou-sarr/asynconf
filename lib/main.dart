
import 'package:asynconf/pages/add_event_page.dart';
import 'package:asynconf/pages/event_pages.dart';
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

  int _currentIndex = 0;

  setCurrentIndex(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const [
            Text("Accueil",
              style: TextStyle( fontFamily: "Poppins",color: Colors.white),
            ),
            Text("Liste des conférences",
              style: TextStyle( fontFamily: "Poppins",color: Colors.white),
            ),
            Text("Formulaire",
              style: TextStyle( fontFamily: "Poppins",color: Colors.white),
            )
          ][_currentIndex],
          backgroundColor: Color(0xFF008890),
        ),
        body: [
            HomePage(),
            EventPage(),
            AddEventPage()
        ][_currentIndex],

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setCurrentIndex(index),
          selectedItemColor: Color(0xFF008890),
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,

          elevation: 20,  iconSize: 24,

          items: const  [
            BottomNavigationBarItem(
              icon:  Icon(Icons.home),
              label: 'Accueil',
            ),

            BottomNavigationBarItem(
              icon:  Icon(Icons.calendar_month),
              label: 'Planning',
            ),

            BottomNavigationBarItem(
              icon:  Icon(Icons.add_circle_outline),
              label: 'Ajout',
            ),

          ],
        ),
      ),
    );
  }
}
