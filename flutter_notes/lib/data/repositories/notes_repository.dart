import 'package:get/get.dart';
import '../../services/database_service.dart';
import '../models/note.dart';

class NotesRepository {
  final DatabaseService _dbService = Get.find<DatabaseService>();

  List<Note> getAllNotes() {
    return _dbService.getAllNotes();
  }

  Note? getNoteById(int id) {
    return _dbService.getNote(id);
  }

  int saveNote(Note note) {
    // Automatically update the updatedAt timestamp on save
    note.updatedAt = DateTime.now();
    return _dbService.saveNote(note);
  }

  bool deleteNote(int id) {
    return _dbService.deleteNote(id);
  }
}
