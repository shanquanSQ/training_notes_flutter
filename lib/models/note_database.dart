import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';

// Imported Library for finding available path directory on mobile devices
import 'package:path_provider/path_provider.dart'; // State Management

import 'note.dart';

class NoteDatabase extends ChangeNotifier {
  static late Isar isar; // Not sure what this does

  // Initialise Database
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([NoteSchema],
        directory: dir.path); // [NoteSchema] name is generated by Isar in note.g.dart
  }

  // final notes = isar.notes;

  /// CRUD FUNCTIONALITY

// List of Notes - Buffer to read saved notes from DB
  final List<Note> currentNotes = [];

// Create
  Future<void> addNote(String userInputText) async {
    // Create new Note object
    final newNote = Note()..text = userInputText;

    // Save to DB
    await isar.writeTxn(() => isar.notes.put(newNote));

    // Re-read from DB - Refreshes Buffer
    fetchNotes();
  }

// Read
  Future<void> fetchNotes() async {
    List<Note> fetchedNotes = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchedNotes);
    notifyListeners(); // Notify widgets that are listening to changes
  }

// Update
  Future<void> updateNote(int id, String updatedText) async {
    final existingNote = await isar.notes.get(id); //.notes is generated , .get is a Query

    if (existingNote != null) {
      existingNote.text = updatedText;
      await isar.writeTxn(() => isar.notes.put(existingNote));
      await fetchNotes();
    }
  }

// Delete
  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNotes();
  }
}
