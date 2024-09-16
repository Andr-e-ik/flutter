import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_todo/features/bloc/todo_list_bloc.dart';
import 'package:front_todo/rep.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List<TodoList>? _taskList;
  final _todoListBloc = TodoListBloc(RespTask());
  @override
  void initState() {
    // loadTask();
    _todoListBloc.add(LoadTodoList());
    super.initState();
  }
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _todoListBloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                style: TextStyle(fontSize: 18),
                controller: _controller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.9,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.7,
                    ),
                  ),
                  fillColor: Colors.grey.withOpacity(0.20),
                  filled: true,
                  hintText: 'Enter the name of the task',
                  hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.add_circle_outline,
                      color: Colors.black.withOpacity(0.25),
                      size: 30,
                    ),
                    onPressed: () {
                      addTask();
                    },
                  ),
                ),
                onSubmitted: (value) {
                  addTask();
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<TodoListBloc, TodoListState>(
                bloc: _todoListBloc,
                builder: (context, state) {
                  if (state is TodoListLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is TodoListLoaded) {
                    final tasks = state.tasks;
                    return ListView.separated(
                      itemCount: tasks.length,
                      separatorBuilder: (context, index) => Divider(),
                      itemBuilder: (context, i) {
                        final task = tasks[i];
                        return ListTile(
                          title: Text(
                            '№${task.id} ${task.title}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              _todoListBloc.add(DeleteTodo(task.id));
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(0),
                              shape: StadiumBorder(),
                              backgroundColor:
                              Colors.white70.withOpacity(0.8),
                              minimumSize: Size(50, 32),
                            ),
                            child: Icon(
                              Icons.close,
                              color: Colors.red.withOpacity(0.65),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is TodoListError) {
                    return Center(child: Text(state.message));
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addTask() {
    final taskName = _controller.text.trim();
    if (taskName.isNotEmpty) {
      _todoListBloc.add(AddTodo(taskName));
      _controller.clear();
    }
  }
}



//строка для ввода задачи
// ListView.builder(
//     itemCount: _taskList!.length,
//     itemBuilder: (context, i) => ListTile(
//       title: TextField(
//         controller: _controller,
//         decoration: InputDecoration(
//           hintText: 'Enter the name of the task'
//         ),
//       ),
//     )),

//показать список задач
// (_taskList == null)
// ? const SizedBox()
//     : ListView.separated(
// itemCount: _taskList!.length,
// separatorBuilder: (context, index) => const Divider(),
// itemBuilder: (context, i){
// final task = _taskList![i];
// final taskName = task.title;
// final taskId = task.id;