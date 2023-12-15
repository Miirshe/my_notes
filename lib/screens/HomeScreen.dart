import 'package:flutter/material.dart';
import 'package:my_notes/widgets/NoteCard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Notes',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
          textAlign: TextAlign.start,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.filter_alt_outlined))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search for title note',
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context , index){
              return NoteCard();
            })
          )
        ],
      ),
    );
  }
}
