
import 'dart:io';

import 'package:asynconf/pages/event_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';




class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //   Image.asset("assets/images/rh.png"),
            SizedBox(
              width: 400, height: 400,
              child: SvgPicture.asset("assets/images/logo.svg"),
            ),
            const SizedBox(height: 1),

            const Text("Asynconf 2024",
              style: TextStyle(fontSize: 40, fontFamily: "Poppins"),
            ),
            const Text("Salon virtuel de l'informatique du 31 Janvier au 10 Février",
                style:  TextStyle(fontSize: 20 ),
                textAlign: TextAlign.center
            ),
            Padding(padding: EdgeInsets.only(top: 10)),

            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color(0xFF008890))
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const EventPage()
                    )
                );
              },
              child: const Text("Voir les planning",
                style: TextStyle(fontSize: 20, color: Colors.white ),
              ),
            ),
          ]
      ),
    );
  }
}
