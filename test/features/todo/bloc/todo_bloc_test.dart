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
  final List<TodoModel> mockIncompleteTodoList = List.from(mockIncompleteJson)
      .map<TodoModel>((item) => TodoModel.fromJson(item))
      .toList();

  const String mockTodoToAddString = '''
    {
      "heading": "Complete Project",
      "description": "Complete the Project by evening." 
    }''';
  final mockAddJson = jsonDecode(mockTodoToAddString);
  final TodoModel mockTodoToAdd = TodoModel.fromJson(mockAddJson);

  const String mockTodoCompletedString = '''
    {
        "heading": "Groceries",
        "description": "Get this weeks groceries." 
      }''';
  final mockCompletedJson = jsonDecode(mockTodoCompletedString);
  final TodoModel mockTodoCompleted = TodoModel.fromJson(mockCompletedJson);

  const String mockCompleteString = '''
    [
    {
        "heading": "Python",
        "description": "Start learning Python" 
      },
      {
        "heading": "Testing",
        "description": "Start learning testing Python." 
      }
    ]''';
  final mockCompleteJson = jsonDecode(mockCompleteString) as List;
  final List<TodoModel> mockCompleteTodoList = List.from(mockCompleteJson)
      .map<TodoModel>((item) => TodoModel.fromJson(item))
      .toList();

  const String mockTodoIncompletedString = '''
    {
        "heading": "Groceries",
        "description": "Get this weeks groceries." 
      }''';
  final mockIncompletedJson = jsonDecode(mockTodoIncompletedString);
  final TodoModel mockTodoIncompleted = TodoModel.fromJson(mockIncompletedJson);

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
    act: (bloc) => bloc.add(const TodoLoadEvent()),
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
    "when error is thrown while loading todos",
    setUp: () {
      when(todoRepository.loadIncompleteTodo).thenThrow("Error");
      when(todoRepository.loadCompletedTodo).thenThrow("Error");
    },
    build: () => TodoBloc(todoRepository: todoRepository),
    act: (bloc) => bloc.add(const TodoLoadEvent()),
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
    build: () => TodoBloc(todoRepository: todoRepository),
    seed: () => TodoLoadedState(
      incompleteTodo: IncompleteTodo(incompleteTodo: mockIncompleteTodoList),
      completedTodo: const CompletedTodo(completedTodo: []),
    ),
    act: (bloc) => bloc.add(TodoAddedEvent(addedTodo: mockTodoToAdd)),
    expect: () => <TodoState>[
      TodoLoadedState(
        incompleteTodo: IncompleteTodo(
            incompleteTodo: [...mockIncompleteTodoList, mockTodoToAdd]),
        completedTodo: const CompletedTodo(completedTodo: []),
      )
    ],
    verify: (_) {
      verify(() => todoRepository.addToTodo(mockTodoToAdd)).called(1);
    },
  );

  blocTest<TodoBloc, TodoState>(
    "emits [TodoLoadErrorState]"
    "when error is thrown, after todo is added",
    setUp: () {
      when(() => todoRepository.addToTodo(mockTodoToAdd)).thenThrow("Error");
    },
    build: () => TodoBloc(todoRepository: todoRepository),
    seed: () => TodoLoadedState(
      incompleteTodo: IncompleteTodo(incompleteTodo: mockIncompleteTodoList),
      completedTodo: const CompletedTodo(completedTodo: []),
    ),
    act: (bloc) => bloc.add(TodoAddedEvent(addedTodo: mockTodoToAdd)),
    expect: () => <TodoState>[TodoLoadErrorState("Error")],
    verify: (_) {
      verify(() => todoRepository.addToTodo(mockTodoToAdd)).called(1);
    },
  );

  blocTest<TodoBloc, TodoState>(
    "emits [TodoLoadedState]"
    "when todos is marked completed from incomplete list",
    setUp: () {
      when(() => todoRepository.completedATodo(mockTodoCompleted))
          .thenAnswer((_) => {});
    },
    build: () => TodoBloc(todoRepository: todoRepository),
    seed: () => TodoLoadedState(
      incompleteTodo: IncompleteTodo(incompleteTodo: mockIncompleteTodoList),
      completedTodo: const CompletedTodo(completedTodo: []),
    ),
    act: (bloc) =>
        bloc.add(TodoCompletedEvent(completedTodo: mockTodoCompleted)),
    expect: () => <TodoState>[
      TodoLoadedState(
        incompleteTodo: IncompleteTodo(
            incompleteTodo: [...mockIncompleteTodoList]
              ..remove(mockTodoCompleted)),
        completedTodo: CompletedTodo(completedTodo: [mockTodoCompleted]),
      )
    ],
    verify: (_) {
      verify(() => todoRepository.completedATodo(mockTodoCompleted)).called(1);
    },
  );

  blocTest<TodoBloc, TodoState>(
    "emits [TodoLoadErrorState]"
    "when error is thrown, after todo is marked completed from incomplete list",
    setUp: () {
      when(() => todoRepository.completedATodo(mockTodoCompleted))
          .thenThrow("Error");
    },
    build: () => TodoBloc(todoRepository: todoRepository),
    seed: () => TodoLoadedState(
      incompleteTodo: IncompleteTodo(incompleteTodo: mockIncompleteTodoList),
      completedTodo: const CompletedTodo(completedTodo: []),
    ),
    act: (bloc) =>
        bloc.add(TodoCompletedEvent(completedTodo: mockTodoCompleted)),
    expect: () => <TodoState>[TodoLoadErrorState("Error")],
    verify: (_) {
      verify(() => todoRepository.completedATodo(mockTodoCompleted)).called(1);
    },
  );

  blocTest<TodoBloc, TodoState>(
    "emits [TodoLoadedState]"
    "when todos is marked as incompleted from completed list",
    setUp: () {
      when(() => todoRepository.notCompletedATodo(mockTodoCompleted))
          .thenAnswer((_) => {});
    },
    build: () => TodoBloc(todoRepository: todoRepository),
    seed: () => TodoLoadedState(
      incompleteTodo: IncompleteTodo(incompleteTodo: mockIncompleteTodoList),
      completedTodo: CompletedTodo(completedTodo: mockCompleteTodoList),
    ),
    act: (bloc) =>
        bloc.add(TodoIncompletedEvent(incompletedTodo: mockTodoIncompleted)),
    expect: () => <TodoState>[
      TodoLoadedState(
        incompleteTodo: IncompleteTodo(
            incompleteTodo: [...mockIncompleteTodoList, mockTodoIncompleted]),
        completedTodo: CompletedTodo(
            completedTodo: [...mockCompleteTodoList]
              ..remove(mockTodoIncompleted)),
      ),
    ],
    verify: (_) {
      verify(() => todoRepository.notCompletedATodo(mockTodoCompleted))
          .called(1);
    },
  );

  blocTest<TodoBloc, TodoState>(
    "emits [TodoLoadErrorState]"
    "when error is thrown, after todos is marked as incompleted from completed list",
    setUp: () {
      when(() => todoRepository.notCompletedATodo(mockTodoCompleted))
          .thenThrow("Error");
    },
    build: () => TodoBloc(todoRepository: todoRepository),
    seed: () => TodoLoadedState(
      incompleteTodo: IncompleteTodo(incompleteTodo: mockIncompleteTodoList),
      completedTodo: CompletedTodo(completedTodo: mockCompleteTodoList),
    ),
    act: (bloc) =>
        bloc.add(TodoIncompletedEvent(incompletedTodo: mockTodoIncompleted)),
    expect: () => <TodoState>[TodoLoadErrorState("Error")],
    verify: (_) {
      verify(() => todoRepository.notCompletedATodo(mockTodoCompleted))
          .called(1);
    },
  );
}
