import 'package:objectbox/objectbox.dart';

@Entity()
class Note {
  @Id()
  int id;

  String title;
  String content;
  
  @Property(type: PropertyType.date)
  DateTime createdAt;
  
  @Property(type: PropertyType.date)
  DateTime updatedAt;
  
  bool isPinned;
  bool isArchived;

  Note({
    this.id = 0,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    this.isPinned = false,
    this.isArchived = false,
  });
}
