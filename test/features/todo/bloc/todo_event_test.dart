import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/features/todo/bloc/todo_bloc.dart';
import 'package:todo_app/features/todo/data/models/todo_model.dart';

class FakeTodoModel extends Fake implements TodoModel {}

void main() {
  group("TodoEvent", () {
    group("TodoLoadEvent", () {
      test("supports value comparison", () {
        expect(TodoLoadEvent(), TodoLoadEvent());
      });
    });

    group("TodoAddedEvent", () {
      final fakeTodoModel = FakeTodoModel();

      test("supports value comparison", () {
        expect(TodoAddedEvent(addedTodo: fakeTodoModel),
            TodoAddedEvent(addedTodo: fakeTodoModel));
      });
    });

    group("TodoCompletedEvent", () {
      final fakeTodoModel = FakeTodoModel();

      test("supports value comparison", () {
        expect(TodoCompletedEvent(completedTodo: fakeTodoModel),
            TodoCompletedEvent(completedTodo: fakeTodoModel));
      });
    });

    group("TodoIncompletedEvent", () {
      final fakeTodoModel = FakeTodoModel();

      test("supports value comparison", () {
        expect(TodoIncompletedEvent(incompletedTodo: fakeTodoModel),
            TodoIncompletedEvent(incompletedTodo: fakeTodoModel));
      });
    });
  });
}
