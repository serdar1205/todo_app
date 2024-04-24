part of 'active_todo_count_bloc.dart';

abstract class ActiveTodoCountEvent extends Equatable {
  const ActiveTodoCountEvent();

  @override
  List<Object> get props => [];
}

class CalculateActiveTodoCountEvent extends ActiveTodoCountEvent {
  final int activeTodoCount;

  const CalculateActiveTodoCountEvent(this.activeTodoCount);

  @override
  String toString() {
    return 'CalculateActiveTodoCountEvent{activeTodoCount: $activeTodoCount}';
  }

  @override
  List<Object> get props => [activeTodoCount];
}
