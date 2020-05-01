import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:rxdart/rxdart.dart';

final noteStream = NoteStream();

class NoteStream {

  final _getNotesSubject = BehaviorSubject<List<String>>();
  List<String> notes = ['a'];
  String currentNote;

  Stream<List<String>> get getNotes => _getNotesSubject.stream;

  void updateNoteDB() async {
    String listToJSON(List<String> list) => jsonEncode(list);
    List<String> listFromJSON(String jsonString) => List<String>.from(jsonDecode(jsonString));

    final _masterDBKey = 'allNotes';
    SharedPreferences notesDB = await SharedPreferences.getInstance();
    notes.add(currentNote ??= 'current note was null');
    await notesDB.setString(_masterDBKey, listToJSON(notes));
    notes = listFromJSON(notesDB.get(_masterDBKey));
    _getNotesSubject.add(notes);
  }
}