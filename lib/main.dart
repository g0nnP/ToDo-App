import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app/pages/home/bloc/todos/todos_bloc.dart';

import 'app/pages/home/bloc/pagination/pagination_bloc.dart';
import 'app/pages/home/home_page.dart';
import 'app/routes/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PaginationBloc()),
        BlocProvider(create: (_) => TodosBloc())
      ],
      child: MaterialApp(
        title: 'Material App',
        routes: appRoutes,
        initialRoute: HomePage.screenName,
      ),
    );
  }
}