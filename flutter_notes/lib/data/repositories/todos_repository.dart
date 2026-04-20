import 'package:get/get.dart';
import '../../services/database_service.dart';
import '../models/todo.dart';

class TodosRepository {
  final DatabaseService _dbService = Get.find<DatabaseService>();

  List<Todo> getAllTodos() {
    return _dbService.getAllTodos();
  }

  Todo? getTodoById(int id) {
    return _dbService.getTodo(id);
  }

  int saveTodo(Todo todo) {
    return _dbService.saveTodo(todo);
  }

  bool deleteTodo(int id) {
    return _dbService.deleteTodo(id);
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isCompleted = !todo.isCompleted;
    return saveTodo(todo) > 0;
  }
}
