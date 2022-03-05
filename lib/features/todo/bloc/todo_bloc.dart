
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/features/todo/data/models/completed_todo.dart';
import 'package:todo_app/features/todo/data/models/incomplete_todo.dart';
import 'package:todo_app/features/todo/data/models/todo_model.dart';
import 'package:todo_app/features/todo/data/repository/todo_repository.dart';

import '../data/models/incomplete_todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository todoRepository;

  TodoBloc({required this.todoRepository}) : super(TodoLoadingState()) {
    on<TodoLoadEvent>(_onTodoLoadEvent);
    on<TodoAddedEvent>(_onTodoAddedEvent);
    on<TodoCompletedEvent>(_onTodoCompletedEvent);
    on<TodoIncompletedEvent>(_onTodoIncompleteEvent);
  }

  void _onTodoLoadEvent(TodoLoadEvent event, Emitter<TodoState> emit) {
    emit(TodoLoadingState());

    try {
      final incompleteTodos = todoRepository.loadIncompleteTodo();
      final completedTodos = todoRepository.loadCompletedTodo();

      emit(
        TodoLoadedState(
          incompleteTodo: IncompleteTodo(incompleteTodo: [...incompleteTodos]),
          completedTodo: CompletedTodo(completedTodo: [...completedTodos]),
        ),
      );
    } catch (e) {
      emit(TodoLoadErrorState(e.toString()));
    }
  }

  void _onTodoAddedEvent(TodoAddedEvent event, Emitter<TodoState> emit) {
    final state = this.state;

    if (state is TodoLoadedState) {
      try {
        todoRepository.addToTodo(event.addedTodo);
        emit(TodoLoadedState(
          incompleteTodo: IncompleteTodo(incompleteTodo: [
            ...state.incompleteTodo.incompleteTodo,
            event.addedTodo
          ]),
          completedTodo:
              CompletedTodo(completedTodo: state.completedTodo.completedTodo),
        ));
      } catch (e) {
        emit(TodoLoadErrorState(e.toString()));
      }
    }
  }

  void _onTodoCompletedEvent(
      TodoCompletedEvent event, Emitter<TodoState> emit) {}

  void _onTodoIncompleteEvent(
      TodoIncompletedEvent event, Emitter<TodoState> emit) {}

  
}
