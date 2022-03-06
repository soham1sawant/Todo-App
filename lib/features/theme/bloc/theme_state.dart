part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class ThemeLoadingState extends ThemeState {
  const ThemeLoadingState();
  
  @override
  List<Object> get props => [];
}

class ThemeLoadedState extends ThemeState {
  final bool isDarkMode;

  const ThemeLoadedState({required this.isDarkMode});

  @override
  List<Object> get props => [isDarkMode];
}

class ThemeLoadErrorState extends ThemeState {
  final String error;

  const ThemeLoadErrorState(this.error);

  @override
  List<Object> get props => [error];
}
