import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/cubits/todo_list/todo_list_cubit.dart';

part 'active_todo_count_state.dart';

class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  final TodoListCubit todoListCubit;
  final int initialActiveTodoCount;
  late final StreamSubscription todoListSubscription;

  ActiveTodoCountCubit({
    required this.initialActiveTodoCount,
    required this.todoListCubit,
  }) : super(ActiveTodoCountState(activeTodoCount: initialActiveTodoCount)) {
    todoListSubscription = todoListCubit.stream.listen((todoListState) {
      print('todoListState: $todoListState');

      final int activeTodoCount =
          todoListState.todos.where((todo) => !todo.completed).toList().length;

      emit(state.copyWith(activeTodoCount: activeTodoCount));
    });
  }

  @override
  Future<void> close() {
    todoListSubscription.cancel();
    return super.close();
  }
}
