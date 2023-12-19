import 'package:flutter/material.dart';
import '../models/Notes.dart';
class Note extends StatefulWidget {
  const Note({super.key, required this.note});
  final Notes note;
  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text(widget.note.title),
        backgroundColor: Color(int.parse('0xff'+widget.note.color),),),
      body: Container( child: Text(widget.note.description ?? ''),),
    );
  }
}
