import 'package:objectbox/objectbox.dart';

@Entity()
class Todo {
  @Id()
  int id;

  String title;
  bool isCompleted;
  
  @Property(type: PropertyType.date)
  DateTime createdAt;

  // Optional: Link to a specific note
  int? noteId;

  Todo({
    this.id = 0,
    required this.title,
    this.isCompleted = false,
    required this.createdAt,
    this.noteId,
  });
}
