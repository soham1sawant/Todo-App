import 'package:equatable/equatable.dart';

import 'package:todo_app/features/todo/data/models/todo_model.dart';

class IncompleteTodo extends Equatable {
  final List<TodoModel> incompleteTodo;

  const IncompleteTodo({this.incompleteTodo = const <TodoModel>[]});

  @override
  List<Object?> get props => [incompleteTodo];
}
