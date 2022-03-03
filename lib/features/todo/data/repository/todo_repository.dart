import 'package:todo_app/features/todo/data/models/todo_model.dart';

class TodoRepository {
  List<TodoModel> incompleteTodo = [];
  List<TodoModel> completedTodo = [];

  List<TodoModel> loadIncompleteTodo() => incompleteTodo;

  List<TodoModel> loadCompletedTodo() => completedTodo;

  void addToTodo(TodoModel todo) {
    incompleteTodo.add(todo);
  }

  void completedATodo(TodoModel todo) {
    incompleteTodo.remove(todo);

    completedTodo.add(todo);
  }

  void notCompletedATodo(TodoModel todo) {
    completedTodo.remove(todo);

    incompleteTodo.add(todo);
  }
}
