part of 'todo_list_bloc.dart';

class TodoListState {}

class TodoListInitial extends TodoListState {}

class TodoListLoading extends TodoListState {}

class TodoListLoaded extends TodoListState {
  final List<TodoList> tasks;
  TodoListLoaded(this.tasks);
}

class TodoListError extends TodoListState {
  final String message;
  TodoListError(this.message);
}
