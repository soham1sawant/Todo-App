part of 'todo_bloc.dart';

@immutable
abstract class TodoState extends Equatable {}

class TodoLoadingState extends TodoState {
  @override
  List<Object?> get props => [];
}

class TodoLoadedState extends TodoState {
  final IncompleteTodo incompleteTodo;
  final CompletedTodo completedTodo;

  TodoLoadedState({
    this.incompleteTodo = const IncompleteTodo(),
    this.completedTodo = const CompletedTodo(),
  });

  @override
  List<Object?> get props => [incompleteTodo, completedTodo];
}

class TodoLoadErrorState extends TodoState {
  final String error;

  TodoLoadErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
