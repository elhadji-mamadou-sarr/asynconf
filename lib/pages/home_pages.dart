
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //   Image.asset("assets/images/rh.png"),
            SvgPicture.asset("assets/images/logo.svg"),
            const Padding(padding: EdgeInsets.only(top: 10)),
            const Text("Asynconf 2024",
              style: TextStyle(fontSize: 42,
                  fontFamily: "Poppins"
              ),
            ),
            const Text("Salon virtuel de l'informatique du 31 Janvier au 10 Février",
                style:  TextStyle(fontSize: 20 ),
                textAlign: TextAlign.center
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.lightBlue)
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => EventPage()
                    )
                );
              },
              child: const Text("Voir les planning",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ]
      ),
    );
  }
}
