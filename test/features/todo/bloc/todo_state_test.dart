import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/features/todo/bloc/todo_bloc.dart';
import 'package:todo_app/features/todo/data/models/completed_todo.dart';
import 'package:todo_app/features/todo/data/models/incomplete_todo.dart';

class FakeCompletedTodo extends Fake implements CompletedTodo {}

class FakeIncompleteTodo extends Fake implements IncompleteTodo {}

void main() {
  group("TodoState", () {
    group("TodoLoadingState", () {
      test("supports value comparison", () {
        expect(TodoLoadingState(), TodoLoadingState());
      });
    });

    group("TodoLoadedState", () {
      final fakeIncompleteTodo = FakeIncompleteTodo();
      final fakeCompletedTodo = FakeCompletedTodo();
      test("supports value comparison", () {
        expect(
          TodoLoadedState(
              incompleteTodo: fakeIncompleteTodo,
              completedTodo: fakeCompletedTodo),
          TodoLoadedState(
              incompleteTodo: fakeIncompleteTodo,
              completedTodo: fakeCompletedTodo),
        );
      });
    });

    group("TodoLoadErrorState", () {
      test("supports  value comparison", () {
        expect(TodoLoadErrorState(""), TodoLoadErrorState(""));
      });
    });
  });
}
