import 'package:get/get.dart';
import '../../modules/notes/notes_binding.dart';
import '../../modules/todos/todos_binding.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    NotesBinding().dependencies();
    TodosBinding().dependencies();
  }
}
