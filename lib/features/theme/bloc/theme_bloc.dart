import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/features/theme/data/repository/theme_repository.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeRepository themeRepository;

  ThemeBloc({required this.themeRepository})
      : super(const ThemeLoadingState()) {
    on<ThemeLoadEvent>(_onThemeLoadEvent);
    on<DarkThemeEvent>(_onDarkThemeEvent);
  }

  void _onThemeLoadEvent(ThemeLoadEvent event, Emitter<ThemeState> emit) {
    emit(const ThemeLoadingState());

    try {
      final theme = themeRepository.loadTheme();

      emit(ThemeLoadedState(isDarkMode: theme));
    } catch (e) {
      emit(ThemeLoadErrorState(e.toString()));
    }
  }

  void _onDarkThemeEvent(DarkThemeEvent event, Emitter<ThemeState> emit) {
    final state = this.state;

    if (state is ThemeLoadedState) {
      try {
        themeRepository.setDarkMode();

        emit(const ThemeLoadedState(isDarkMode: true));
      } catch (e) {
        emit(ThemeLoadErrorState(e.toString()));
      }
    }
  }
}
