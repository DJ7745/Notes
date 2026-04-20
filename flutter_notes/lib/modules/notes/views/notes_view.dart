import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/note.dart';
import '../notes_controller.dart';
import 'note_editor_view.dart';
import '../../settings/views/settings_view.dart';

class NotesView extends GetView<NotesController> {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Notes', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Get.to(() => const SettingsView()),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (val) => controller.searchQuery.value = val,
              decoration: InputDecoration(
                hintText: 'Search notes...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface.withOpacity(0.5),
              ),
            ),
          ),
          Expanded(
             child: Obx(() {
               if (controller.filteredNotes.isEmpty) {
                 return const Center(child: Text("No notes found."));
               }
               return ListView.builder(
                 padding: const EdgeInsets.symmetric(horizontal: 16),
                 itemCount: controller.filteredNotes.length,
                 itemBuilder: (context, index) {
                   final note = controller.filteredNotes[index];
                   return Card(
                     margin: const EdgeInsets.only(bottom: 12),
                     child: ListTile(
                       title: Text(note.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                       subtitle: Text(note.content, maxLines: 2, overflow: TextOverflow.ellipsis),
                       trailing: IconButton(
                         icon: Icon(note.isPinned ? Icons.push_pin : Icons.push_pin_outlined),
                         onPressed: () => controller.togglePin(note),
                       ),
                       onTap: () => Get.to(() => NoteEditorView(note: note)),
                     ),
                   );
                 }
               );
             }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const NoteEditorView()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
