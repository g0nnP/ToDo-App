import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app/pages/home/bloc/todos/todos_bloc.dart';

class DoneTodosScreen extends StatelessWidget {
  const DoneTodosScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodosBloc, TodosState>(
        builder: (_, state) {
          if(state is TodosInitialState) {
            return const Center(child: Text('No completed ToDos here'));
          }
          return ListView.separated(
            itemBuilder: (_, i) {
              return ListTile(
                title: Text(state.completedTodos[i].title)
              );
            },
            separatorBuilder: (_, i) => const Divider(),
            itemCount: state.completedTodos.length
          );
        }
      )
    );
  }
}