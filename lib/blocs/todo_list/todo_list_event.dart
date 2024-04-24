part of 'todo_list_bloc.dart';

abstract class TodoListEvent extends Equatable {
  const TodoListEvent();

  @override
  List<Object> get props => [];
}

class AddTodoEvent extends TodoListEvent {
  final String todoDesc;

  const AddTodoEvent(this.todoDesc);

  @override
  String toString() {
    return 'AddTodoEvent{todoDesc: $todoDesc}';
  }

  @override
  List<Object> get props => [todoDesc];
}

class EditTodoEvent extends TodoListEvent {
  final String id;
  final String todoDesc;

  const EditTodoEvent({required this.id, required this.todoDesc});

  @override
  String toString() {
    return 'EditTodoEvent{id: $id, todoDesc: $todoDesc}';
  }

  @override
  List<Object> get props => [id, todoDesc];
}

class ToggleTodoEvent extends TodoListEvent {
  final String id;

  const ToggleTodoEvent(this.id);

  @override
  String toString() {
    return 'ToggleTodoEvent{id: $id}';
  }

  @override
  List<Object> get props => [id];
}

class RemoveTodoEvent extends TodoListEvent {
  final Todo todo;

  const RemoveTodoEvent(this.todo);

  @override
  String toString() {
    return 'RemoveTodoEvent{todo: $todo}';
  }

  @override
  List<Object> get props => [todo];
}
