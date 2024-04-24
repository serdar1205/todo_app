import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/active_todo_count/active_todo_count_cubit.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Todo',
          style: TextStyle(fontSize: 40),
        ),
        // BlocBuilder<ActiveTodoCountCubit, ActiveTodoCountState>(
        //   builder: (context, state) {
        //     return Text(
        //       '${state.activeTodoCount} items left',
        //       style: TextStyle(fontSize: 20),
        //     );
        //   },
        // ),
        Text(
          '${context.watch<ActiveTodoCountCubit>().state.activeTodoCount} items left',
          style: TextStyle(fontSize: 20,color: Colors.redAccent),
        )
      ],
    );
  }
}
