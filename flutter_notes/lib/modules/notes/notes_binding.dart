import 'package:get/get.dart';
import '../../data/repositories/notes_repository.dart';
import 'notes_controller.dart';

class NotesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotesRepository>(() => NotesRepository());
    Get.lazyPut<NotesController>(() => NotesController());
  }
}
