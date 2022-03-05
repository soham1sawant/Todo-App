part of 'date_bloc.dart';

abstract class DateState extends Equatable {
  const DateState();

  @override
  List<Object> get props => [];
}

class DateLoadingState extends DateState {
  const DateLoadingState();

  @override
  List<Object> get props => [];
}

class DateLoadedState extends DateState {
  final DateModel dateModel;

  const DateLoadedState({required this.dateModel});

  @override
  List<Object> get props => [];
}

class DateLoadErrorState extends DateState {
  final String error;

  const DateLoadErrorState(this.error);

  @override
  List<Object> get props => [error];
}
