part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent extends Equatable {}

class TodoLoadEvent extends TodoEvent {

  @override
  List<Object?> get props => [];
}

class TodoAddedEvent extends TodoEvent {

  @override
  List<Object?> get props => [];
}

class TodoCompletedEvent extends TodoEvent {

  @override
  List<Object?> get props => [];
}

class TodoIncompleteEvent extends TodoEvent {

  @override
  List<Object?> get props => [];
}