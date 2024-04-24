import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/cubits.dart';

class CreateTodo extends StatefulWidget {
  const CreateTodo({super.key});

  @override
  State<CreateTodo> createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {

  final TextEditingController newTodoCtrl = TextEditingController();

  @override
  void dispose() {
    newTodoCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: newTodoCtrl,
      decoration: InputDecoration(labelText: 'What to do?'),
      onSubmitted: (String? todoDesc){
        if (todoDesc != null && todoDesc.trim().isNotEmpty) {
          context.read<TodoListCubit>().addTodo(todoDesc);
          newTodoCtrl.clear();
        }
      },
    );
  }
}
