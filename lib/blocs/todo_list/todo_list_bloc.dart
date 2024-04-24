import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/models/todo_model.dart';

part 'todo_list_event.dart';

part 'todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  TodoListBloc() : super(TodoListState.initial()) {
    on<AddTodoEvent>(_addTodo);
    on<EditTodoEvent>(_editTodo);
    on<ToggleTodoEvent>(_toggleTodo);
    on<RemoveTodoEvent>(_removeTodo);
  }

  void _addTodo(AddTodoEvent event, Emitter<TodoListState> emit) {
    final newTodo = Todo(desc: event.todoDesc);
    final newTodos = [...state.todos, newTodo];

    emit(state.copyWith(todos: newTodos));
  }

  void _editTodo(EditTodoEvent event, Emitter<TodoListState> emit) {
    final newTodos = state.todos.map((e) {
      if (e.id == event.id) {
        return Todo(
          id: event.id,
          desc: event.todoDesc,
          completed: e.completed,
        );
      }
      return e;
    }).toList();
    emit(state.copyWith(todos: newTodos));
  }

  void _toggleTodo(ToggleTodoEvent event, Emitter<TodoListState> emit) {
    final newTodos = state.todos.map((e) {
      if (e.id == event.id) {
        return Todo(
          id: event.id,
          desc: e.desc,
          completed: !e.completed,
        );
      }
      return e;
    }).toList();
    emit(state.copyWith(todos: newTodos));
  }

  void _removeTodo(RemoveTodoEvent event, Emitter<TodoListState> emit) {
    final newTodos =
        state.todos.where((element) => element.id != event.todo.id).toList();
    emit(state.copyWith(todos: newTodos));
  }
}
