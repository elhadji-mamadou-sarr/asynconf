
import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {

  final events = [
    {
      "nom" : "Awa Thiaré Sarr",
      "date" : "02 Février à 10h : 00",
      "Subject" : "Le code de Lagy",
      "avatar" : "Lior",
    },

    {
      "nom" : "Mamadou Sarr",
      "date" : "25 Février à 08h : 00",
      "Subject" : "Le code de Lagy",
      "avatar" : "ba",
    }

  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index ) {
            final event = events[index];
            final nom = event["nom"];
            final date = event['date'];

            return Card(
                child:  ListTile(
                  leading:  Image(image: AssetImage("assets/images/ba.png")),
                  title: Text('$nom'),
                  subtitle: Text('$date'),
                  trailing: Icon(Icons.more_vert),
                )
            );

          }

      ),
    );

  }
}

