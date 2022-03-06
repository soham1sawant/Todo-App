import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/features/theme/bloc/theme_bloc.dart';
import 'package:todo_app/features/theme/data/repository/theme_repository.dart';

class MockThemeRepository extends Mock implements ThemeRepository {}

void main() {
  late ThemeRepository themeRepository;

  setUp(() {
    themeRepository = MockThemeRepository();
  });

  test("initial state is ThemeLoadingState", () {
    expect(
      ThemeBloc(themeRepository: themeRepository).state,
      const ThemeLoadingState(),
    );
  });

  blocTest<ThemeBloc, ThemeState>(
    "emits [ThemeLoadingState, ThemeLoadedState]"
    "when theme is loaded successfully",
    setUp: () {
      when(themeRepository.loadTheme).thenAnswer((_) => false);
    },
    build: () => ThemeBloc(themeRepository: themeRepository),
    act: (bloc) => bloc.add(const ThemeLoadEvent()),
    expect: () => <ThemeState>[
      const ThemeLoadingState(),
      const ThemeLoadedState(isDarkMode: false)
    ],
    verify: (_) {
      verify(themeRepository.loadTheme).called(1);
    },
  );

  blocTest<ThemeBloc, ThemeState>(
    "emits [ThemeLoadingState, ThemeLoadErrorState]"
    "when error is thrown while loading theme",
    setUp: () {
      when(themeRepository.loadTheme).thenThrow("Error");
    },
    build: () => ThemeBloc(themeRepository: themeRepository),
    act: (bloc) => bloc.add(const ThemeLoadEvent()),
    expect: () => <ThemeState>[
      const ThemeLoadingState(),
      const ThemeLoadErrorState("Error")
    ],
    verify: (_) {
      verify(themeRepository.loadTheme).called(1);
    },
  );

  blocTest<ThemeBloc, ThemeState>(
    "emits [ThemeLoadedState]"
    "when theme is changed to Dark",
    setUp: () {
      when(themeRepository.setDarkMode).thenAnswer((_) => {});
    },
    build: () => ThemeBloc(themeRepository: themeRepository),
    seed: () => const ThemeLoadedState(isDarkMode: false),
    act: (bloc) => bloc.add(const DarkThemeEvent()),
    expect: () => <ThemeState>[const ThemeLoadedState(isDarkMode: true)],
    verify: (_) {
      verify(themeRepository.setDarkMode).called(1);
    },
  );

  blocTest<ThemeBloc, ThemeState>(
    "emits [ThemeLoadErrorState]"
    "when error is thrown while changing the theme to dark",
    setUp: () {
      when(themeRepository.setDarkMode).thenThrow("Error");
    },
    build: () => ThemeBloc(themeRepository: themeRepository),
    seed: () => const ThemeLoadedState(isDarkMode: false),
    act: (bloc) => bloc.add(const DarkThemeEvent()),
    expect: () => <ThemeState>[const ThemeLoadErrorState("Error")],
    verify: (_) {
      verify(themeRepository.setDarkMode).called(1);
    },
  );

}
