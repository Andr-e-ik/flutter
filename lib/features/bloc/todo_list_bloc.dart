import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_todo/models/model.dart';
import 'package:front_todo/rep.dart';

part 'todo_list_event.dart';
part 'todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  final RespTask respTask;

  TodoListBloc(this.respTask) : super(TodoListLoading()) {
    on<LoadTodoList>((event, emit) async {
      try {
        final tasks = await respTask.getTaskList();
        emit(TodoListLoaded(tasks));
      } catch (e) {
        emit(TodoListError('Error loading tasks'));
      }
    });

    on<AddTodo>((event, emit) async {
      if (state is TodoListLoaded) {
        await respTask.addTask(event.taskName);
        final updatedTasks = await respTask.getTaskList();
        emit(TodoListLoaded(updatedTasks));
      }
    });

    on<DeleteTodo>((event, emit) async {
      if (state is TodoListLoaded) {
        await respTask.deleteTask(event.taskId);
        final updatedTasks = await respTask.getTaskList();
        emit(TodoListLoaded(updatedTasks));
      }
    });

    on<UpdateTodoStatus>((event, emit) async {
      if (state is TodoListLoaded) {
        await respTask.updateTask(event.taskId, event.taskStatus);
        final updatedTasks = await respTask.getTaskList();
        emit(TodoListLoaded(updatedTasks));
      }
    });
  }
}
