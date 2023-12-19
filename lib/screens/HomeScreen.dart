import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_notes/models/Notes.dart';
import 'package:my_notes/widgets/NoteCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<Notes>> getNotes() async {
    final noteRef = firestore.collection('notes');
    final data = await noteRef.get();
    List<Notes> notes = [];
    return data.docs.map((e) => Notes.fromJson(e.data())).toList();
  }

  @override
  Widget build(BuildContext context) {
    getNotes();
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
              child: FutureBuilder<List<Notes>>(
                  future: getNotes(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      final notes = snapshot.data!;
                      return ListView.builder(
                          itemCount: notes.length,
                          itemBuilder: (context, index) {
                            return NoteCard(notes: notes[index],);
                          });
                    }
                  }))
        ],
      ),
    );
  }
}
