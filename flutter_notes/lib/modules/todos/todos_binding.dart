import 'package:get/get.dart';
import '../../data/repositories/todos_repository.dart';
import 'todos_controller.dart';

class TodosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodosRepository>(() => TodosRepository());
    Get.lazyPut<TodosController>(() => TodosController());
  }
}
