import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/features/todo/bloc/todo_bloc.dart';
import 'package:todo_app/features/todo/data/repository/todo_repository.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  late TodoRepository todoRepository;

  setUp(() {
    todoRepository = MockTodoRepository();
  });

  test("initial state is TodoLoadingState", () {
    expect(TodoBloc(todoRepository: todoRepository).state, TodoLoadingState());
  });
}
