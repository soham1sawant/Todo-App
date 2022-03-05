import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/features/date/bloc/date_bloc.dart';
import 'package:todo_app/features/date/data/models/date_model.dart';
import 'package:todo_app/features/date/data/repository/date_repository.dart';

class MockDateRepository extends Mock implements DateRepository {}

void main() {
  late DateRepository dateRepository;

  setUp(() {
    dateRepository = MockDateRepository();
  });

  test("initial state is DateLoadingState", () {
    expect(DateBloc(dateRepository: dateRepository).state,
        const DateLoadingState());
  });

  blocTest<DateBloc, DateState>(
    "emits [DateLoadingState, DateLoadedState]"
    "when date is loaded successfully",
    setUp: () {
      when(dateRepository.getMonth).thenAnswer((_) => "March");
      when(dateRepository.getDate).thenAnswer((_) => "9");
      when(dateRepository.getYear).thenAnswer((_) => "2020");
    },
    build: () => DateBloc(dateRepository: dateRepository),
    act: (bloc) => bloc.add(const DateLoadEvent()),
    expect: () => <DateState>[
      const DateLoadingState(),
      const DateLoadedState(dateModel: DateModel("March", "9", "2020"))
    ],
    verify: (_) {
      verify(dateRepository.getMonth).called(1);
      verify(dateRepository.getDate).called(1);
      verify(dateRepository.getYear).called(1);
    },
  );

  blocTest<DateBloc, DateState>(
    "emits [DateLoadingState, DateLoadErrorState]"
    "when error is thrown, while date is being loaded",
    setUp: () {
      when(dateRepository.getMonth).thenThrow("Error");
    },
    build: () => DateBloc(dateRepository: dateRepository),
    act: (bloc) => bloc.add(const DateLoadEvent()),
    expect: () => <DateState>[
      const DateLoadingState(),
      const DateLoadErrorState("Error"),
    ],
    verify: (_) {
      verify(dateRepository.getMonth).called(1);
    },
  );
}
