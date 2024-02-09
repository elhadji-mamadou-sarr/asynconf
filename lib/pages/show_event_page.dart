import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'my_scafold.dart';

class ShowEventPage extends StatelessWidget {
  final dynamic event;

  const ShowEventPage({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String date;
    date = DateFormat.yMd().add_jz().format(event['date'].toDate());

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
              image: AssetImage("assets/images/${event['avatar']}.png"),
              fit: BoxFit.cover,
            ),
          ),

          Container(
            margin: const EdgeInsets.only(left: 0, top: 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Nom du conférencier :  ${event['speaker']}',
                  style: const TextStyle(fontSize: 20, ),
                ),
              )
          ),

               const Padding(padding: EdgeInsets.only(left: 0, top: 15)),
               SizedBox(
                 width: MediaQuery.of(context).size.width,
                child: Text('Date de la conférence :  ${date}',
                  style: const TextStyle(fontSize: 20, ),
                ),
              ),

          const Padding(padding: EdgeInsets.only(left: 0, top: 15)),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Sujet :  ${event['subject']}',
                  style: const TextStyle(fontSize: 20, ),
                ),
              ),

        ],
      ),
    );
  }
}
