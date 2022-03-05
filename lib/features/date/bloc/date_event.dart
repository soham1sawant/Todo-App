part of 'date_bloc.dart';

abstract class DateEvent extends Equatable {
  const DateEvent();

  @override
  List<Object> get props => [];
}

class DateLoadEvent extends DateEvent {
  const DateLoadEvent();

  @override
  List<Object> get props => [];
}
