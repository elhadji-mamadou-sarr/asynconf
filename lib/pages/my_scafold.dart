
import 'package:asynconf/pages/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:asynconf/pages/add_event_page.dart';
import 'package:asynconf/pages/edit_event_page.dart';
import 'package:asynconf/pages/event_pages.dart';
import 'package:asynconf/pages/home_pages.dart';
import 'package:firebase_core/firebase_core.dart';

class MyScaffold extends StatelessWidget {
  final int currentIndex;
  final Function(int) setCurrentIndex;
  final Widget body;

  const MyScaffold({
    Key? key,
    required this.currentIndex,
    required this.setCurrentIndex,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: Container(
          color: const Color(0xFFFFFFFF),
          child: const MyDrawer()
      ),

      appBar: AppBar(


        title: [
          const Text(
            "Accueil",
            style: TextStyle(fontFamily: "Poppins", color: Colors.white),
          ),
          const Text(
            "Liste des conférences",
            style: TextStyle(fontFamily: "Poppins", color: Colors.white),
          ),
          const Text(
            "Formulaire",
            style: TextStyle(fontFamily: "Poppins", color: Colors.white),
          ),
          const Text(
            "Modifier l'evenement",
            style: TextStyle(fontFamily: "Poppins", color: Colors.white),
          ),
          const Text(
            "Détail d'un evenement",
            style: TextStyle(fontFamily: "Poppins", color: Colors.white),
          ),

        ][currentIndex],
        backgroundColor: const Color(0xFF008890),
      ),

      body: body,
      bottomNavigationBar: BottomNavigationBar(
       // currentIndex: currentIndex,
        onTap: setCurrentIndex,
        selectedItemColor: const Color(0xFF008890),
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        elevation: 20,
        iconSize: 24,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Planning',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Ajout',
          ),
        ],
      ),
    );
  }
}
