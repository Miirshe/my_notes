import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
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
                        'doctor appointment',
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
                      Text('In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate '
                          'the visual form of a document or a typeface without relying on meaningful content.',
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
                decoration: BoxDecoration(color: Colors.white12),
              )
            ],
          )),
    );
  }
}
