import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'shared_preferences.dart';

class ListedNotes extends StatefulWidget {
  @override
  _ListedNotesState createState() => _ListedNotesState();
}

class _ListedNotesState extends State<ListedNotes> {

  @override
  Widget build(context) {
    return StreamBuilder<List<String>>(
        stream: noteStream.getNotes,
        builder: (context, noteSnap) {
          if (!noteSnap.hasData) {
            return Center(child: Text('no notes yet'));
          } else {
            return ListView.builder(
              itemCount: noteSnap.data.length,
              itemBuilder: (context, index) {
                return Card(
                    borderOnForeground: true,
                    elevation: 5,
                    color: Colors.black12,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(width: 4, color: Colors.lightBlue)
                          )
                      ),
                      child: ListTile(
                        title: Text(noteSnap.data[index]),
                        trailing: IconButton(
                            icon: Icon(Icons.more_vert, color: Colors.white70),
                            onPressed: () {
                              noteStream.notes.removeAt(index);
                              noteStream.updateNoteDB();
                            }
                        ),
                      ),
                    )
                );
              }
              );
          }
        }
    );
  }
}