import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/cubits/filter/filter_cubit.dart';
import 'package:todo_app/cubits/search/search_cubit.dart';
import 'package:todo_app/cubits/todo_list/todo_list_cubit.dart';
import 'package:todo_app/models/todo_model.dart';

part 'filtered_todos_state.dart';

class FilteredTodosCubit extends Cubit<FilteredTodosState> {
  final FilterCubit filterCubit;
  final SearchCubit searchCubit;
  final TodoListCubit todoListCubit;
  final List<Todo> initialTodos;

  late StreamSubscription filterSubscription;
  late StreamSubscription searchSubscription;
  late StreamSubscription todoListSubscription;

  FilteredTodosCubit({
    required this.initialTodos,
    required this.filterCubit,
    required this.searchCubit,
    required this.todoListCubit,
  }) : super(FilteredTodosState(filteredTodos: initialTodos)) {
    filterSubscription = filterCubit.stream.listen((filterState) {
      setFilteredTodos();
    });
    searchSubscription = searchCubit.stream.listen((searchState) {
      setFilteredTodos();
    });
    todoListSubscription = todoListCubit.stream.listen((todoListState) {
      setFilteredTodos();
    });
  }

  void setFilteredTodos() {
    List<Todo> filteredTodos = [];

    switch (filterCubit.state.filter) {
      case Filter.active:
        filteredTodos = todoListCubit.state.todos
            .where((element) => !element.completed)
            .toList();
        break;
      case Filter.completed:
        filteredTodos = todoListCubit.state.todos
            .where((element) => element.completed)
            .toList();
        break;
      case Filter.all:
      default:
      filteredTodos = todoListCubit.state.todos;
    }

    if (searchCubit.state.searchItem.isNotEmpty) {
      filteredTodos = filteredTodos
          .where((todo) =>
              todo.desc.toLowerCase().contains(searchCubit.state.searchItem))
          .toList();
    }
    emit(state.copyWith(filteredTodos: filteredTodos));
  }

  @override
  Future<void> close() {
    filterSubscription.cancel();
    searchSubscription.cancel();
    todoListSubscription.cancel();
    return super.close();
  }
}
