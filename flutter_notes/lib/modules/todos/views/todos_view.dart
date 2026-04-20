import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/todo.dart';
import '../todos_controller.dart';

class TodosView extends GetView<TodosController> {
  const TodosView({super.key});

  void _addTodoDialog(BuildContext context) {
    final titleCtrl = TextEditingController();
    Get.dialog(
      AlertDialog(
        title: const Text('Add Task'),
        content: TextField(
          controller: titleCtrl,
          decoration: const InputDecoration(hintText: 'What needs to be done?'),
          autofocus: true,
        ),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              if (titleCtrl.text.isNotEmpty) {
                controller.addTodo(
                  Todo(title: titleCtrl.text, createdAt: DateTime.now())
                );
              }
              Get.back();
            },
            child: const Text('Add')
          )
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Todos', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Obx(() {
        if (controller.todos.isEmpty) {
          return const Center(child: Text("No todos yet."));
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.todos.length,
          itemBuilder: (context, index) {
            final todo = controller.todos[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: Checkbox(
                  value: todo.isCompleted,
                  onChanged: (_) => controller.toggleTodoStatus(todo),
                ),
                title: Text(
                  todo.title,
                  style: TextStyle(
                    decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline, color: Colors.transparent),
                  color: Colors.red,
                  onPressed: () => controller.deleteTodo(todo.id),
                ),
              ),
            );
          }
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTodoDialog(context),
        child: const Icon(Icons.add_task),
      ),
    );
  }
}
