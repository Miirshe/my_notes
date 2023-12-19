import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:my_notes/models/Notes.dart';
import 'package:my_notes/screens/Note.dart';

class NoteCard extends StatefulWidget {
  final Notes notes;
  const NoteCard({super.key, required this.notes});
  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> deleteNote (String id)async {
    await firestore.collection('notes').doc(id).delete();
  }
  @override
  Widget build(BuildContext context) {
    return SwipeActionCell(
      key: ObjectKey(widget.notes.id),
      trailingActions: <SwipeAction>[
        SwipeAction(
            title: "delete",
            onTap: (CompletionHandler handler) async {
              await handler(true);
              await deleteNote(widget.notes.id);
              setState(() {});

            },
            color: Colors.red),

        SwipeAction(
            widthSpace: 120,
            title: "popAlert",
            onTap: (CompletionHandler handler) async {
              /// false means that you just do nothing,it will close
              /// action buttons by default
              handler(false);
              showCupertinoDialog(
                  context: context,
                  builder: (c) {
                    return CupertinoAlertDialog(
                      title: Text('ok'),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          child: Text('confirm'),
                          isDestructiveAction: true,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  });
            },
            color: Colors.orange),
      ],
      child:Padding(
        padding: const EdgeInsets.all(10.0),
        child: Material(
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_){
                return Note(note: widget.notes,);
              }));

            },
            child: Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                    color: Colors.white10),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12 , vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.notes.title,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 3),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 10,),
                            Row( children: [
                              Icon(Icons.watch_later_outlined, size: 20 , color: Colors.red,),
                              SizedBox(width: 10,),
                              Text('20 minute ago', style: TextStyle(fontSize: 16),)
                            ],),
                            SizedBox(height: 10,),
                            Text(widget.notes.description ?? '',
                              style: TextStyle(fontSize: 16),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 50,
                      height: double.infinity,
                      decoration: BoxDecoration(color: Color(int.parse('0xff'+widget.notes.color))),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
