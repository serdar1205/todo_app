import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/blocs/blocs.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Todo',
          style: TextStyle(fontSize: 40),
        ),
        BlocBuilder<ActiveTodoCountBloc, ActiveTodoCountState>(
          builder: (context, state) {
            return Text(
              '${state.activeTodoCount} items left',
              style: TextStyle(fontSize: 20),
            );
          },
        ),
        // Text(
        //   '${context.watch<ActiveTodoCountCubit>().state.activeTodoCount} items left',
        //   style: TextStyle(fontSize: 20,color: Colors.redAccent),
        // )
      ],
    );
  }
}
