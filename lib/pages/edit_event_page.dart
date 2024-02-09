import 'package:asynconf/pages/event_pages.dart';
import 'package:asynconf/pages/my_scafold.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditEventPage extends StatefulWidget {
  final DocumentSnapshot event;

  const EditEventPage({Key? key, required this.event}) : super(key: key);

  @override
  _EditEventPageState createState() => _EditEventPageState();
}

class _EditEventPageState extends State<EditEventPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController confNameController;
  late TextEditingController speakerNameController;
  late String selectedConfType;
  late DateTime selectedConfDate;

  @override
  void initState() {
    super.initState();
    confNameController = TextEditingController(text: widget.event['subject']);
    speakerNameController = TextEditingController(text: widget.event['speaker']);
    selectedConfType = widget.event['avatar'];
    selectedConfDate = (widget.event['date'] as Timestamp).toDate();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      currentIndex: 3, // Mettez l'index correct du bas de navigation
      setCurrentIndex: (index) {
      },
      body: Container(
        padding: const EdgeInsets.all(16.0),
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              initialPickerDateTime: selectedConfDate,

              onChanged: (DateTime? value) {
                selectedConfDate = value!;
              },

            ),

            const Padding(padding: EdgeInsets.only(top: 15)),

            SizedBox(
              height: 50,
              width: double.infinity,

              child:ElevatedButton(

                onPressed: () async {

                  //if (_formKey.currentState!.validate()) {
                    final confName = confNameController.text;
                    final speakerName = speakerNameController.text;

                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Envoi en cours "))
                    );

                    FocusScope.of(context).requestFocus(FocusNode());

                    CollectionReference eventRef = FirebaseFirestore.instance.collection("Events");

                    await eventRef.doc(widget.event.id).update({
                      "speaker": speakerName,
                      "date": selectedConfDate,
                      "subject": confName,
                      "avatar" : "ba"
                    });

                    // ignore: use_build_context_synchronously
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) =>const EventPage()
                        )
                    );

                 // }
                },

                child: Text("Sauvegarder", style: TextStyle(fontSize: 20, color: Colors.white)),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xFF008890))
                ),
              ),

            ),


          ],

        ),
      ),

    );
  }
}
