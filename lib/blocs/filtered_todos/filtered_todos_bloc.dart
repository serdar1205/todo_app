import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/blocs/blocs.dart';
import 'package:todo_app/models/todo_model.dart';

part 'filtered_todos_event.dart';

part 'filtered_todos_state.dart';

class FilteredTodosBloc extends Bloc<FilteredTodosEvent, FilteredTodosState> {
  final TodoFilterBloc filterBloc;
  final TodoSearchBloc searchBloc;
  final TodoListBloc todoListBloc;
  final List<Todo> initialTodos;

  late StreamSubscription filterSubscription;
  late StreamSubscription searchSubscription;
  late StreamSubscription todoListSubscription;

  FilteredTodosBloc({
    required this.filterBloc,
    required this.searchBloc,
    required this.todoListBloc,
    required this.initialTodos,
  }) : super(FilteredTodosState(filteredTodos: initialTodos)) {
    filterSubscription = filterBloc.stream.listen((filterState) {
      setFilteredTodos();
    });
    searchSubscription = searchBloc.stream.listen((searchState) {
      setFilteredTodos();
    });
    todoListSubscription = todoListBloc.stream.listen((todoListState) {
      setFilteredTodos();
    });

    on<CalculateFilteredTodosEvent>((event, emit) {
      emit(state.copyWith(filteredTodos: event.filteredTodos));
    });
  }

  void setFilteredTodos() {
    List<Todo> filteredTodos = [];

    switch (filterBloc.state.filter) {
      case Filter.active:
        filteredTodos = todoListBloc.state.todos
            .where((element) => !element.completed)
            .toList();
        break;
      case Filter.completed:
        filteredTodos = todoListBloc.state.todos
            .where((element) => element.completed)
            .toList();
        break;
      case Filter.all:
      default:
        filteredTodos = todoListBloc.state.todos;
    }

    if (searchBloc.state.searchItem.isNotEmpty) {
      filteredTodos = filteredTodos
          .where((todo) =>
              todo.desc.toLowerCase().contains(searchBloc.state.searchItem))
          .toList();
    }
    add(CalculateFilteredTodosEvent(filteredTodos));
  }

@override
Future<void> close() {
  filterSubscription.cancel();
  searchSubscription.cancel();
  todoListSubscription.cancel();
  return super.close();
}


}
