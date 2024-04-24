import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/models/todo_model.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState.initial());

  void addTodo(String todoDesc) {
    final newTodo = Todo(desc: todoDesc);
    final newTodos = [...state.todos, newTodo];
    emit(state.copyWith(todos: newTodos));
    print(state);
  }

  void editTodo(String id, String todoDesc) {
    final newTodo = state.todos.map((e) {
      if (e.id == id) {
        return Todo(id: id, desc: todoDesc, completed: e.completed);
      }
      return e;
    }).toList();

    emit(state.copyWith(todos: newTodo));
  }

  void toggleTodo(String id) {
    final newTodo = state.todos.map((e) {
      if (e.id == id) {
        return Todo(id: id, desc: e.desc, completed: !e.completed);
      }
      return e;
    }).toList();

    emit(state.copyWith(todos: newTodo));
  }

  void removeTodo(Todo todo) {
    final newTodo =
        state.todos.where((element) => element.id != todo.id).toList();

    emit(state.copyWith(todos: newTodo));
  }
}
