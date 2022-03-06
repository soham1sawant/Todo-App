import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/features/theme/bloc/theme_bloc.dart';

void main() {
  group("ThemeState", () {
    group("ThemeLoadingState", () {
      test("supports value comparison", () {
        expect(const ThemeLoadingState(), const ThemeLoadingState());
      });
    });

    group("ThemeLoadedState", () {
      test("supports value comparison", () {
        expect(const ThemeLoadedState(isDarkMode: true), const ThemeLoadedState(isDarkMode: true));
      });
    });

    group("ThemeLoadErrorState", () {
      test("supports value comparison", () {
        expect(const ThemeLoadErrorState("Error"), const ThemeLoadErrorState("Error"));
      });
    });
  });
}
