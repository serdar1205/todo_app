import 'package:flutter/material.dart';
import 'package:todo_app/blocs/blocs.dart';
import 'package:todo_app/pages/todo_page/todo_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoFilterBloc>(create: (context) => TodoFilterBloc()),
        BlocProvider<TodoListBloc>(create: (context) => TodoListBloc()),
        BlocProvider<TodoSearchBloc>(create: (context) => TodoSearchBloc()),
        BlocProvider<ActiveTodoCountBloc>(
            create: (context) => ActiveTodoCountBloc(
                  initialActiveTodoCount:
                      context.read<TodoListBloc>().state.todos.length,
                  todoListBloc: context.read<TodoListBloc>(),
                )),
        BlocProvider<FilteredTodosBloc>(
            create: (context) => FilteredTodosBloc(
                  initialTodos: context.read<TodoListBloc>().state.todos,
                  filterBloc: context.read<TodoFilterBloc>(),
                  searchBloc: context.read<TodoSearchBloc>(),
                  todoListBloc: context.read<TodoListBloc>(),
                )),
      ],
      child: MaterialApp(
        title: 'Todo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const TodoPage(),
      ),
    );
  }
}
