import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/models/todo_model.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterState.initial());

  void changeFilter(Filter newFilter) {
    emit(state.copyWith(filter: newFilter));
  }
}
