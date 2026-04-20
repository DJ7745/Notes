import 'package:get/get.dart';
import '../../data/models/note.dart';
import '../../data/repositories/notes_repository.dart';

class NotesController extends GetxController {
  final NotesRepository _repository = Get.find<NotesRepository>();

  final RxList<Note> notes = <Note>[].obs;
  final RxList<Note> filteredNotes = <Note>[].obs;
  
  final RxString searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadNotes();
    
    // Setup debounce for searching (Step 10 preview)
    debounce(searchQuery, (_) => filterNotes(), time: const Duration(milliseconds: 300));
  }

  void loadNotes() {
    notes.assignAll(_repository.getAllNotes());
    filterNotes();
  }

  void addNote(Note note) {
    if (_repository.saveNote(note) > 0) {
      loadNotes();
    }
  }

  void updateNote(Note note) {
    if (_repository.saveNote(note) > 0) {
      loadNotes();
    }
  }

  void deleteNote(int id) {
    if (_repository.deleteNote(id)) {
      loadNotes();
    }
  }

  void togglePin(Note note) {
    note.isPinned = !note.isPinned;
    updateNote(note);
  }

  void toggleArchive(Note note) {
    note.isArchived = !note.isArchived;
    updateNote(note);
  }

  void filterNotes() {
    if (searchQuery.value.trim().isEmpty) {
      filteredNotes.assignAll(notes);
    } else {
      final query = searchQuery.value.toLowerCase();
      filteredNotes.assignAll(notes.where((note) => 
        note.title.toLowerCase().contains(query) || 
        note.content.toLowerCase().contains(query)
      ).toList());
    }
    // Advanced sorting logic will be added here in Step 10
  }
}
