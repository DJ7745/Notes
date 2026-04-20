import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/note.dart';
import '../notes_controller.dart';

class NoteEditorView extends StatefulWidget {
  final Note? note;
  const NoteEditorView({super.key, this.note});

  @override
  State<NoteEditorView> createState() => _NoteEditorViewState();
}

class _NoteEditorViewState extends State<NoteEditorView> {
  late final TextEditingController _titleCtrl;
  late final TextEditingController _contentCtrl;
  final NotesController _notesController = Get.find<NotesController>();

  @override
  void initState() {
    super.initState();
    _titleCtrl = TextEditingController(text: widget.note?.title ?? '');
    _contentCtrl = TextEditingController(text: widget.note?.content ?? '');
  }

  void _save() {
    if (_titleCtrl.text.isEmpty && _contentCtrl.text.isEmpty) return;

    final note = widget.note ?? Note(
      title: _titleCtrl.text,
      content: _contentCtrl.text,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    
    note.title = _titleCtrl.text;
    note.content = _contentCtrl.text;

    if (note.id == 0) {
      _notesController.addNote(note);
    } else {
      _notesController.updateNote(note);
    }
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? 'New Note' : 'Edit Note'),
        actions: [
          if (widget.note != null) 
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: () {
                _notesController.deleteNote(widget.note!.id);
                Get.back();
              },
            ),
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: _save,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleCtrl,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(hintText: 'Title', border: InputBorder.none),
            ),
            Expanded(
              child: TextField(
                controller: _contentCtrl,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(hintText: 'Start typing...', border: InputBorder.none),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
