import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/features/todo/bloc/todo_bloc.dart';
import 'package:todo_app/features/todo/data/models/completed_todo.dart';
import 'package:todo_app/features/todo/data/models/incomplete_todo.dart';
import 'package:todo_app/features/todo/data/models/todo_model.dart';
import 'package:todo_app/features/todo/data/repository/todo_repository.dart';


class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  late TodoRepository todoRepository;

  const String mockIncompleteString = '''
    [
    {
        "heading": "Project",
        "description": "Start the coding project." 
      },
      {
        "heading": "Groceries",
        "description": "Get this weeks groceries." 
      }
    ]''';
  final mockIncompleteJson = jsonDecode(mockIncompleteString) as List;
  // final List<TodoModel> mockIncompleteTodo = List.from(mockIncompleteJson)
  //     .map<TodoModel>((item) => TodoModel.fromJson(item))
  //     .toList();
  final List<TodoModel> mockIncompleteTodo = [];

  const String mockTodoToAddString = '''
    {
      "heading": "Complete Project",
      "description": "Complete the Project by evening." 
    }''';
  final mockAddJson = jsonDecode(mockTodoToAddString);
  final TodoModel mockTodoToAdd = TodoModel.fromJson(mockAddJson);

  setUp(() {
    todoRepository = MockTodoRepository();
  });

  test("initial state is TodoLoadingState", () {
    expect(TodoBloc(todoRepository: todoRepository).state, TodoLoadingState());
  });

  blocTest<TodoBloc, TodoState>(
    "emits [TodoLoadingState, TodoLoadedState]"
    "when todos are loaded successfully",
    setUp: () {
      when(todoRepository.loadIncompleteTodo).thenAnswer((_) => []);
      when(todoRepository.loadCompletedTodo).thenAnswer((_) => []);
    },
    build: () => TodoBloc(todoRepository: todoRepository),
    act: (bloc) => bloc.add(TodoLoadEvent()),
    expect: () => <TodoState>[
      TodoLoadingState(),
      TodoLoadedState(
        incompleteTodo: const IncompleteTodo(incompleteTodo: []),
        completedTodo: const CompletedTodo(completedTodo: []),
      )
    ],
    verify: (_) {
      verify(todoRepository.loadIncompleteTodo).called(1);
      verify(todoRepository.loadCompletedTodo).called(1);
    },
  );

  blocTest<TodoBloc, TodoState>(
    "emits [TodoLoadingState, TodoLoadErrorState]"
    "when todos are not loaded successfully",
    setUp: () {
      when(todoRepository.loadIncompleteTodo).thenThrow("Error");
      when(todoRepository.loadCompletedTodo).thenThrow("Error");
    },
    build: () => TodoBloc(todoRepository: todoRepository),
    act: (bloc) => bloc.add(TodoLoadEvent()),
    expect: () => <TodoState>[
      TodoLoadingState(),
      TodoLoadErrorState("Error"),
    ],
    verify: (_) {
      verify(todoRepository.loadIncompleteTodo).called(1);
    },
  );

  blocTest<TodoBloc, TodoState>(
    "emits [TodoLoadedState]"
    "when todos is successfully added",
    setUp: () {
      when(() => todoRepository.addToTodo(mockTodoToAdd)).thenAnswer((_) => {});
    },
    build: () =>TodoBloc(todoRepository: todoRepository),
    seed: () => TodoLoadedState(
      incompleteTodo: IncompleteTodo(incompleteTodo: mockIncompleteTodo),
      completedTodo: const CompletedTodo(completedTodo: []),
    ),
    act: (bloc) => bloc.add(TodoAddedEvent(addedTodo: mockTodoToAdd)),
    expect: () => <TodoState>[
      TodoLoadedState(
        incompleteTodo: IncompleteTodo(
            incompleteTodo: [...mockIncompleteTodo, mockTodoToAdd]),
        completedTodo: const CompletedTodo(completedTodo: []),
      )
    ],
    verify: (_) {
      verify(() => todoRepository.addToTodo(mockTodoToAdd)).called(1);
    },
  );
}
