import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/dialog_widget.dart';

import 'bloc/pagination/pagination_bloc.dart';
import 'screens/done_todos_screen.dart';
import 'screens/todos_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String screenName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ToDo App'),
      ),
      body: BlocBuilder<PaginationBloc, int>(
        builder: (context, state) {
          final bloc = context.read<PaginationBloc>();
          return IndexedStack(
            index: bloc.state,
            children: const [TodosScreen(), DoneTodosScreen()],
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<PaginationBloc, int>(
        builder: (context, state) {
          final bloc = context.read<PaginationBloc>();
          return BottomNavigationBar(
            currentIndex: bloc.state,
            onTap: (i) => bloc.add(ChangeTabEvent(i)),
            items: const [
              BottomNavigationBarItem(label: 'ToDos', icon: Icon(Icons.list)),
              BottomNavigationBarItem(
                  label: 'Done ToDos', icon: Icon(Icons.check_box))
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showDialog(
          context: context, builder: (context) => AddTodoDialog())
      ),
    );
  }
}
