

import 'package:asynconf/pages/accueil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../firebase_options.dart';


class Login extends StatefulWidget {
   Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

   void signUserIn() async{
     showDialog(
         context: context, 
         builder: (context){
           return const Center(
             child: CircularProgressIndicator(),
           );
         }
     );
     try {
       await FirebaseAuth.instance.signInWithEmailAndPassword(
           email: usernameController.text,
           password: passwordController.text
       );
     } on FirebaseAuthException catch (e) {
       incorrectIndentity();
     }

     Navigator.pop(context);

   }

   void incorrectIndentity(){
     showDialog(
         context: context,
         builder: (context){
           return const AlertDialog(
             title: Text("Identifiant incorrecte !"),
           );
         }
     );
   }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/a.png"),
              fit: BoxFit.cover,
            ),
          ),

          //margin: const EdgeInsets.all(24),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(context),
              _inputField(context),
              _forgotPassword(context),
              _signup(context),
            ],
          ),
        ),

      ),
    );
  }

  _header(context) {
    return Container(
        width: 300,
        child: Image.asset("assets/images/auth.png"),
    );

  }

  _inputField(context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: usernameController,
            decoration: InputDecoration(
                hintText: "Username",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none
                ),

                fillColor: const Color(0xFF008890).withOpacity(0.1),
                filled: true,
                prefixIcon: const Icon(Icons.person)),
          ),

          const SizedBox(height: 10),

          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              hintText: "Password",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
              fillColor: Color(0xFF008890).withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.password),
            ),
            obscureText: true,
          ),

          const SizedBox(height: 10),

          ElevatedButton(
            onPressed: () {
              signUserIn();
            },

            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Color(0xFF008890),
            ),
            child: const Text(
              "Login",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  _forgotPassword(context) {
    return TextButton(
      onPressed: () {},
      child: const Text("Forgot password?",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Dont have an account? "),
        TextButton(
            onPressed: () {
            },
            child: const Text("Sign Up", style: TextStyle(color: Colors.white),)
        )
      ],
    );

  }
}

