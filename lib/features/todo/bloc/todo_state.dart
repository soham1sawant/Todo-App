part of 'todo_bloc.dart';

@immutable
abstract class TodoState extends Equatable {}

class TodoLoadState extends TodoState {
  
  @override
  List<Object?> get props => [];
}

class TodoLoadErrorState extends TodoState {
  
  @override
  List<Object?> get props => [];
}
