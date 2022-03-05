import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/features/date/data/models/date_model.dart';

import 'package:todo_app/features/date/data/repository/date_repository.dart';

part 'date_event.dart';
part 'date_state.dart';

class DateBloc extends Bloc<DateEvent, DateState> {
  final DateRepository dateRepository;

  DateBloc({required this.dateRepository}) : super(const DateLoadingState()) {
    on<DateLoadEvent>((event, emit) {
      emit(const DateLoadingState());

      try {
        final month = dateRepository.getMonth();
        final date = dateRepository.getDate();
        final year = dateRepository.getYear();

        emit(DateLoadedState(dateModel: DateModel(month, date, year)));
      } catch (e) {
        emit(DateLoadErrorState(e.toString()));
      }
    });
  }
}
