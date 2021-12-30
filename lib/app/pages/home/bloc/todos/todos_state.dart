part of 'todos_bloc.dart';

@immutable
abstract class TodosState {
  const TodosState({this.todosList = const []});
  final List<TodoModel> todosList;
}

class TodosInitialState extends TodosState {
  const TodosInitialState() : super(todosList: const []);
}

class TodosFilledState extends TodosState {
  const TodosFilledState(this.todoList) : super(todosList: todoList);
  
  final List<TodoModel> todoList;
}