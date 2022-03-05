import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/features/date/bloc/date_bloc.dart';
import 'package:todo_app/features/date/data/models/date_model.dart';

void main() {
  group("DateState", () {
    group("DateLoadingState", () {
      test("supports value comaparison", () {
        expect(const DateLoadingState(), const DateLoadingState());
      });
    });

    group("DateLoadedState", () {
      DateModel dateModel = const DateModel("","0","0");
      test("supports value comaparison", () {
        expect(DateLoadedState(dateModel: dateModel), DateLoadedState(dateModel: dateModel));
      });
    });

    group("DateLoadErrorState", () {
      test("supports value comaparison", () {
        expect(const DateLoadErrorState("Error"), const DateLoadErrorState("Error"));
      });
    });
  });
}
