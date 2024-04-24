import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/cubits.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/utils/debounce.dart';

class SearchAndFilterTodo extends StatelessWidget {
   SearchAndFilterTodo({super.key});

  final debounce = Debounce(milliseconds: 1000);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
            labelText: 'Search todos',
            border: InputBorder.none,
            filled: true,
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (String? searchItem) {
            if (searchItem != null) {
              debounce.run(() {
                context.read<SearchCubit>().setSearchItem(searchItem);
              });
            }
          },
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            filterButton(context, Filter.all),
            filterButton(context, Filter.active),
            filterButton(context, Filter.completed),
          ],
        )
      ],
    );
  }

  Widget filterButton(BuildContext context, Filter filter) {
    return TextButton(
        onPressed: () {
          context.read<FilterCubit>().changeFilter(filter);
        },
        child: Text(
          filter == Filter.all
              ? 'All'
              : filter == Filter.active
                  ? 'Active'
                  : 'Completed',
          style:  TextStyle(fontSize: 20, color:  textColor(context, filter)),
        ));
  }

  Color textColor(BuildContext context, Filter filter) {
    final currentFilter = context.watch<FilterCubit>().state.filter;
    return currentFilter == filter ? Colors.blue : Colors.grey;
  }
}
