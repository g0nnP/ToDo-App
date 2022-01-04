import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app/pages/home/bloc/todos/todos_bloc.dart';

class TodosScreen extends StatelessWidget {
  const TodosScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodosBloc, TodosState>(
        builder: (context, state) {
          if(state is TodosInitialState){
            return const Center(
              child: Text("No ToDo's here")
            );
          }
          return ListView.separated(
            itemBuilder: (_, i){
              return Dismissible(
                background: Container(
                  color: Colors.red,
                  child: const Icon(Icons.delete, color: Colors.white)
                ),
                key: UniqueKey(),
                onDismissed: (_){
                  context.read<TodosBloc>().add(DeleteTodoEvent(i));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("ToDo ${state.todosList[i].title} deleted"),
                    )
                  );
                },
                child: ListTile(
                  title: Text(
                    state.todosList[i].title,
                    style: state.todosList[i].completed! ? const TextStyle() :
                    const TextStyle(decorationStyle: TextDecorationStyle.dashed),
                  ),
                  subtitle: Text(state.todosList[i].description),
                  trailing: Checkbox(
                    value: state.todosList[i].completed,
                    onChanged: (value) {
                      context.read<TodosBloc>().add(
                        CompleteTodoEvent(value, state.todosList[i])
                      );
                    },
                  )
                ),
              );
            },
            separatorBuilder: (_, i) => const Divider(),
            itemCount: state.todosList.length
          );
        },
      )
    );
  }
}