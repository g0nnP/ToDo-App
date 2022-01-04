import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/app/models/todo_model.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc() : super(const TodosInitialState()) {
    on<AddTodoEvent>((event, emit) {
      final List<TodoModel> _list = [
        ...state.todosList,
        event.todo
      ];
      emit(TodosFilledState(_list));
    });

    on<DeleteTodoEvent>((event, emit){
      final list = state.todosList;
      list.removeAt(event.index);
      if(list.isEmpty) {
        emit(const TodosInitialState());
      } else {
        emit(TodosFilledState(list));
      }
    });

    on<CompleteTodoEvent>((event, emit) {
      event.todo.completed = event.completed;
      final List<TodoModel> _list = [
        ...state.completedTodos,
        event.todo
      ];
      if(event.todo.completed!) emit(TodosFilledState(_list));
    });
  }
}
