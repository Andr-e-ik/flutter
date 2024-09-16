part of 'todo_list_bloc.dart';

class TodoListEvent {}

class LoadTodoList extends TodoListEvent{}

class AddTodo extends TodoListEvent {
  final String taskName;
  AddTodo(this.taskName);
}

class DeleteTodo extends TodoListEvent {
  final int taskId;
  DeleteTodo(this.taskId);
}
