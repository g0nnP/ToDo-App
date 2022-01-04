part of 'todos_bloc.dart';

@immutable
abstract class TodosState {
  const TodosState({this.todosList = const [], this.completedTodos = const []});
  final List<TodoModel> todosList;
  final List<TodoModel> completedTodos;
}

class TodosInitialState extends TodosState {
  const TodosInitialState() :
  super(todosList: const [], completedTodos: const []);
}

class TodosFilledState extends TodosState {
  const TodosFilledState(this.todoList) : super(todosList: todoList);
  
  final List<TodoModel> todoList;
}

class CompletedTodosState extends TodosState {
  const CompletedTodosState(this.completeTodos) : super(completedTodos: completeTodos);

  final List<TodoModel> completeTodos;

}