import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/features/theme/bloc/theme_bloc.dart';

void main() {
  group("ThemeEvent", () {
    group("ThemeLoadEvent", () {
      test("supports value comparison", () {
        expect(const ThemeLoadEvent(), const ThemeLoadEvent());
      });
    });
  });
}
