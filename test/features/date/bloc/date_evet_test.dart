import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/features/date/bloc/date_bloc.dart';

void main() {
  group("DateEvent", () {
    group("DateLoadEvent", () {
      test("supports value comparison", () {
        expect(const DateLoadEvent(), const DateLoadEvent());
      });
    });
  });
}
