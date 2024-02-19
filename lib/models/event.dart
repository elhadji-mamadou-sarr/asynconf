
import 'package:cloud_firestore/cloud_firestore.dart';

class Event{
   late final String id;
   late final String subject;
   late final String avatar;
   late final String speaker;
   late final Timestamp timestamp;

   Event({
      required this.id,
      required this.subject,
      required this.avatar,
      required this.speaker,
      required this.timestamp
   });


   factory Event.fromData(dynamic data){
      return Event(
            id: data['id'],
          subject: data['subject'],
          avatar: data['avatar'].toString().toLowerCase(),
          speaker: data['speaker'],
          timestamp: data['date'],
      );
   }

}