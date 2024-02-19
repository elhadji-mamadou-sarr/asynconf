
import 'package:asynconf/models/event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'my_scafold.dart';


class ShowEventPage extends StatelessWidget {
  final Event event;

  const ShowEventPage( this.event, {Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String date;
    date = DateFormat.yMd().add_jz().format(event.timestamp.toDate());

    return MyScaffold(
      currentIndex: 4, //
      setCurrentIndex: (index) {
      },
      body: Column(

        mainAxisAlignment: MainAxisAlignment.start,

        children: [

          SizedBox(
            height: MediaQuery.of(context).size.height / 2.5,
            width: MediaQuery.of(context).size.width, // La largeur prend toute la largeur de la page
            child: Image(
              image: AssetImage("assets/images/${event.avatar}.png"),
              fit: BoxFit.cover,
            ),
          ),

          const Padding(padding: EdgeInsets.only(left: 0, top: 15)),

          Row(
            children: [
              const Text('Nom du conférencier : ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text('${event.speaker}',
                style: const TextStyle(fontSize: 20, ),
              ),
            ],
          ),

          const Padding(padding: EdgeInsets.only(left: 0, top: 15)),

          Row(
            children: [
              const Text('Date de la conférence : ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('${date}',
                style: const TextStyle(fontSize: 20, ),
              ),
            ],
          ),

          const Padding(padding: EdgeInsets.only(left: 0, top: 15)),

          Row(
            children: [
              const Text('Sujet : ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('${event.subject}',
                style: const TextStyle(fontSize: 20, ),
              ),
            ],
          ),

        ],
      ),

    );


  }



}
