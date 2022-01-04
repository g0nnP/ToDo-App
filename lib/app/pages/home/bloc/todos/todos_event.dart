part of 'todos_bloc.dart';

@immutable
abstract class TodosEvent {}

class SetTodosEvent extends TodosEvent {
  SetTodosEvent(this.todosList);
  final List<TodoModel> todosList;
}

class AddTodoEvent extends TodosEvent {
  AddTodoEvent(this.todo);

  final TodoModel todo;
}

class DeleteTodoEvent extends TodosEvent {
  DeleteTodoEvent(this.index);

  final int index;
}

class CompleteTodoEvent extends TodosEvent {
  CompleteTodoEvent(this.completed, this.todo);  

  final bool completed;
  final TodoModel todo;
}
