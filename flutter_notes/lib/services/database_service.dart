import 'dart:io';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import '../objectbox.g.dart';
import '../data/models/note.dart';
import '../data/models/todo.dart';

class DatabaseService extends GetxService {
  late final Store store;
  late final Box<Note> noteBox;
  late final Box<Todo> todoBox;

  Future<DatabaseService> init() async {
    // Initialize ObjectBox store using Application Documents directory
    final Directory docsDir = await getApplicationDocumentsDirectory();
    final String storePath = '${docsDir.path}/notes_app_db';
    
    // openStore() is generated in objectbox.g.dart
    store = await openStore(directory: storePath);
    noteBox = store.box<Note>();
    todoBox = store.box<Todo>();
    return this;
  }

  @override
  void onClose() {
    store.close();
    super.onClose();
  }

  // --- Note CRUD Operations ---
  int saveNote(Note note) => noteBox.put(note);
  Note? getNote(int id) => noteBox.get(id);
  List<Note> getAllNotes() => noteBox.getAll();
  bool deleteNote(int id) => noteBox.remove(id);

  // --- Todo CRUD Operations ---
  int saveTodo(Todo todo) => todoBox.put(todo);
  Todo? getTodo(int id) => todoBox.get(id);
  List<Todo> getAllTodos() => todoBox.getAll();
  bool deleteTodo(int id) => todoBox.remove(id);
}
