part of 'todo_list_cubit.dart';

@immutable
class TodoListState extends Equatable {
  final List<Todo> todos;

  const TodoListState({required this.todos});


  factory TodoListState.initial(){
    return TodoListState(todos: [
      Todo(id: '1',desc: 'Clean'),
      Todo(id: '2',desc: 'Create'),
      Todo(id: '3',desc: 'Do'),
    ]);
  }



  @override
  String toString() {
    return 'TodoListState{todos: $todos}';
  }

  @override
  List<Object> get props => [todos];

  TodoListState copyWith({
    List<Todo>? todos,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
    );
  }
}
