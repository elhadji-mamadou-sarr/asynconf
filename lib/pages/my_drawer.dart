import 'package:flutter/material.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shadowColor: Colors.red,
      child: ListView(
        children: const [

          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white,  Color(0xFF008890)]
              )
            ),

              child: Center(

                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/elhadji.png"),
                  radius: 50,
                ),
              )
          ),

          Card(
            child: ListTile(
              leading: Icon(Icons.access_alarm, color: Color(0xFF008890)),
              title: Text("Temps"),
              trailing: Icon(Icons.arrow_right),
            ),



          ),

          Card(
            child: ListTile(
              leading: Icon(Icons.access_alarm, color: Color(0xFF008890),),
              title: Text("Temps"),
              trailing: Icon(Icons.arrow_right),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.access_alarm, color: Color(0xFF008890),),
              title: Text("Temps"),
              trailing: Icon(Icons.arrow_right),
            ),
          ),
          
        ],

      ),
    );

  }
}
