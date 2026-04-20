import 'package:get/get.dart';
import '../../data/models/todo.dart';
import '../../data/repositories/todos_repository.dart';

class TodosController extends GetxController {
  final TodosRepository _repository = Get.find<TodosRepository>();

  final RxList<Todo> todos = <Todo>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadTodos();
  }

  void loadTodos() {
    todos.assignAll(_repository.getAllTodos());
  }

  void addTodo(Todo todo) {
    if (_repository.saveTodo(todo) > 0) {
      loadTodos();
    }
  }

  void updateTodo(Todo todo) {
    if (_repository.saveTodo(todo) > 0) {
      loadTodos();
    }
  }

  void toggleTodoStatus(Todo todo) {
    if (_repository.toggleTodoStatus(todo)) {
      loadTodos();
    }
  }

  void deleteTodo(int id) {
    if (_repository.deleteTodo(id)) {
      loadTodos();
    }
  }
}
