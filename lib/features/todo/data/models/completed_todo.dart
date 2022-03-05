import 'package:equatable/equatable.dart';

import 'package:todo_app/features/todo/data/models/todo_model.dart';

class CompletedTodo extends Equatable {
  final List<TodoModel> completedTodo;

  const CompletedTodo({this.completedTodo = const <TodoModel>[]});

  @override
  List<Object?> get props => [completedTodo];
}
