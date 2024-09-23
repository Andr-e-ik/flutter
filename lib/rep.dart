import 'package:dio/dio.dart';
import 'package:front_todo/models/model.dart';


class RespTask {
  Future<List<TodoList>> getTaskList() async{
    final responce = await Dio().get('https://todonow.space/todos/');
    // debugPrint(responce.toString());
    final data = responce.data as List<dynamic>;
    final List<TodoList> taskList = [];
    for (var item in data) {
      String title = item['title'] as String;
      String description = item['description'] as String;
      bool status = item['status'] as bool;
      int id = item['id'] as int;
      taskList.add(TodoList(
        title: title,
        description: description,
        status: status,
        id: id,
      ));
    }
    return taskList;
  }

  Future<void> addTask(String title) async{
    final responce = await Dio().post(
      'https://todonow.space/todos',
      data: {
        'title': title,
      },
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
      ),
    );
  }

  Future<void> deleteTask(int taskId) async{
    final responce = await Dio().post(
      'https://todonow.space/todos/delete/$taskId'
    );
  }

  Future<void> updateTask(int taskId, bool taskStatus) async {
    final response = await Dio().post(
      'https://todonow.space/todos/$taskId',
      data: {
        'status': taskStatus,
      },
    );
  }
}

