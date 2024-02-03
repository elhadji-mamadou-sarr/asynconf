import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {

  final _formKey = GlobalKey<FormState>();

  final confNameController = TextEditingController();
  final speakerNameController = TextEditingController();
  String selectedConfType = "Show";
  DateTime selectedConfDate = DateTime.now();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    confNameController.dispose();
    speakerNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Nom du Conference",
                  hintText: "Entrer le nom de la conference",
                  border: OutlineInputBorder(),
                ),
                validator: (value){
                  if(value==null || value.isEmpty) {
                    return "Ce champ est obligatoire !";
                  } else {
                    return null;
                  }
                },
                controller: confNameController,
              ),

              const Padding(padding: EdgeInsets.only(top: 15)),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Nom du Speaker",
                  hintText: "Entrer le nom du speaker ",
                  border: OutlineInputBorder(),
                ),
                validator: (value){
                  if(value==null || value.isEmpty) {
                    return "Ce champ est obligatoire !";
                  } else {
                    return null;
                  }
                },
                controller: speakerNameController,
              ),

              Container(
                margin: const EdgeInsets.only(top: 15),
                child: DropdownButtonFormField<String>(
                  items: const [
                   // DropdownMenuItem(child: Text("data"))
                  ],
                  value: selectedConfType, // correction ici
                  onChanged: (value) {
                    setState(() {
                      selectedConfType = value!;
                    });
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              const Padding(padding: EdgeInsets.only(top: 15)),

              DateTimeFormField(
                decoration: const InputDecoration(
                  labelText: 'Entrer une Date',
                  border: OutlineInputBorder(),
                ),
                firstDate: DateTime.now().add(const Duration(days: 10)),
                lastDate: DateTime.now().add(const Duration(days: 40)),
                initialPickerDateTime: DateTime.now().add(const Duration(days: 20)),
                onChanged: (DateTime? value) {
                  selectedConfDate = value!;
                },
              ),

              const Padding(padding: EdgeInsets.only(top: 15)),

              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      final confName = confNameController.text;
                      final speakerName = speakerNameController.text;

                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Envoi en cours "))
                      );
                      FocusScope.of(context).requestFocus(FocusNode());

                      CollectionReference eventRef = FirebaseFirestore.instance.collection("Events");

                      eventRef.add({
                        "speaker": speakerName,
                        "date": selectedConfDate,
                        "subject": confName,
                        "avatar": "ba",
                      });

                    }
                  },
                  child: Text("Envoyer", style: TextStyle(fontSize: 20, color: Colors.white)),
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Color(0xFF008890))
                        ),
                    ),
                  ),

              ],

            )

        ),

    );
  }
}

