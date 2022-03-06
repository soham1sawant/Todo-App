part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ThemeLoadEvent extends ThemeEvent {
  const ThemeLoadEvent();

  @override
  List<Object> get props => [];
}

class DarkThemeEvent extends ThemeEvent {
  const DarkThemeEvent();

  @override
  List<Object> get props => [];
}