import 'package:flutter/material.dart';
import 'package:todo_app/cubits/cubits.dart';
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
        BlocProvider<FilterCubit>(create: (context) => FilterCubit()),
        BlocProvider<TodoListCubit>(create: (context) => TodoListCubit()),
        BlocProvider<SearchCubit>(create: (context) => SearchCubit()),
        BlocProvider<ActiveTodoCountCubit>(
            create: (context) =>
                ActiveTodoCountCubit(
                  initialActiveTodoCount:context.read<TodoListCubit>().state.todos.length,
                )),
        BlocProvider<FilteredTodosCubit>(
            create: (context) => FilteredTodosCubit(
              initialTodos: context.read<TodoListCubit>().state.todos,
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
