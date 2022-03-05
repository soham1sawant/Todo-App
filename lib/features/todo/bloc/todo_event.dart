part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class TodoLoadEvent extends TodoEvent {
  const TodoLoadEvent();
  @override
  List<Object?> get props => [];
}

class TodoAddedEvent extends TodoEvent {
  final TodoModel addedTodo;

  const TodoAddedEvent({required this.addedTodo});

  @override
  List<Object?> get props => [addedTodo];
}

class TodoCompletedEvent extends TodoEvent {
  final TodoModel completedTodo;

  const TodoCompletedEvent({required this.completedTodo});

  @override
  List<Object?> get props => [completedTodo];
}

class TodoIncompletedEvent extends TodoEvent {
  final TodoModel incompletedTodo;

  const TodoIncompletedEvent({required this.incompletedTodo});

  @override
  List<Object?> get props => [incompletedTodo];
}
