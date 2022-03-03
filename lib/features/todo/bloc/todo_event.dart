part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent extends Equatable {}

class TodoLoadEvent extends TodoEvent {

  @override
  List<Object?> get props => [];
}

class TodoAddedEvent extends TodoEvent {
  final TodoModel addedTodo;

  TodoAddedEvent({required this.addedTodo});

  @override
  List<Object?> get props => [addedTodo];
}

class TodoCompletedEvent extends TodoEvent {
  final TodoModel completedTodo;

  TodoCompletedEvent({required this.completedTodo});

  @override
  List<Object?> get props => [completedTodo];
}

class TodoIncompletedEvent extends TodoEvent {
  final TodoModel incompletedTodo;

  TodoIncompletedEvent({required this.incompletedTodo});

  @override
  List<Object?> get props => [incompletedTodo];
}
