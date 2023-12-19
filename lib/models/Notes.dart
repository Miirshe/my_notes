import 'package:cloud_firestore/cloud_firestore.dart';

class Notes {
  late String id ;
  late String title;
  String? description;
  late String color;
  late DateTime date;
  Notes.fromJson(Map<String , dynamic> json){
    id = json['id'];
    title = json['title'];
    description = json['description'];
    color = json['color'];
    Timestamp temp = json['date'];
    date = DateTime.fromMillisecondsSinceEpoch(temp.seconds * 1000);
  }
}