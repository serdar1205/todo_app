part of 'active_todo_count_bloc.dart';

class ActiveTodoCountState extends Equatable {
  final int activeTodoCount;

  const ActiveTodoCountState({required this.activeTodoCount});

  factory ActiveTodoCountState.initial() {
    return const ActiveTodoCountState(activeTodoCount: 0);
  }

  @override
  String toString() {
    return 'ActiveTodoCountState{activeTodoCount: $activeTodoCount}';
  }

  @override
  List<Object> get props => [activeTodoCount];

  ActiveTodoCountState copyWith({
    int? activeTodoCount,
  }) {
    return ActiveTodoCountState(
      activeTodoCount: activeTodoCount ?? this.activeTodoCount,
    );
  }
}

