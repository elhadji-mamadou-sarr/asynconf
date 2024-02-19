
import 'package:flutter/material.dart';

import 'add_event_page.dart';
import 'event_pages.dart';
import 'home_pages.dart';
import 'my_scafold.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {

  int _currentIndex = 0;

  setCurrentIndex(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyScaffold(
        currentIndex: _currentIndex,
        setCurrentIndex: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        body: [
          const HomePage(),
          const EventPage(),
          const AddEventPage(),
        ][_currentIndex],
      ),
    );
  }


}
