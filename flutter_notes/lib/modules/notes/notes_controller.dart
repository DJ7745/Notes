import 'package:get/get.dart';
import '../../data/models/note.dart';
import '../../data/repositories/notes_repository.dart';

enum SortOption { date, title }

class NotesController extends GetxController {
  final NotesRepository _repository = Get.find<NotesRepository>();

  final RxList<Note> notes = <Note>[].obs;
  final RxList<Note> filteredNotes = <Note>[].obs;
  
  final RxString searchQuery = ''.obs;
  final Rx<SortOption> currentSort = SortOption.date.obs;

  @override
  void onInit() {
    super.onInit();
    loadNotes();
    
    // Setup debounce for searching
    debounce(searchQuery, (_) => filterNotes(), time: const Duration(milliseconds: 300));
    
    // Refilter to apply sorting immediately when SortOption changes
    ever(currentSort, (_) => filterNotes());
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
    List<Note> tempFiltered;

    // 1. Apply Search Query Filter
    if (searchQuery.value.trim().isEmpty) {
      tempFiltered = List.from(notes);
    } else {
      final query = searchQuery.value.toLowerCase();
      tempFiltered = notes.where((note) => 
        note.title.toLowerCase().contains(query) || 
        note.content.toLowerCase().contains(query)
      ).toList();
    }

    // 2. Apply Sorting Logic (Pinned first, then selected SortOption)
    tempFiltered.sort((a, b) {
      // Pinned notes bubble to top
      if (a.isPinned && !b.isPinned) return -1;
      if (!a.isPinned && b.isPinned) return 1;

      // Apply primary sort criteria
      if (currentSort.value == SortOption.date) {
        return b.updatedAt.compareTo(a.updatedAt); // Descending: Newest first
      } else {
        return a.title.toLowerCase().compareTo(b.title.toLowerCase()); // Ascending: A-Z
      }
    });

    filteredNotes.assignAll(tempFiltered);
  }
}
