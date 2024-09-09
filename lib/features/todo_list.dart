import 'package:flutter/material.dart';
import 'package:front_todo/models/model.dart';
import 'package:front_todo/rep.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TodoList>? _taskList;
  @override
  void initState() {
    loadTask();
    super.initState();
  }
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Enter the name of the task',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: (){
                      addTask();
                    },
                  ),
                ),
                onSubmitted: (value){
                  addTask();
                }
              ),
            ),
            Expanded(
              child: _taskList == null
                  ? Center(child: CircularProgressIndicator())
                  : ListView.separated(
                itemCount: _taskList!.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, i){
                  final task = _taskList![i];
                  final taskName = task.title;
                  final taskId = task.id;
                  return ListTile(
                    title: Text('№$taskId $taskName'),
                    trailing: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () async {
                        await RespTask().deleteTask(taskId);
                        await loadTask();
                      },
                    )
                  );
                },
              )
            )
          ],
        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  Future<void> loadTask() async {
    _taskList = await RespTask().getTaskList();
    setState(() {
    });
  }
  void addTask() async {
    final taskName = _controller.text.trim();
    if (taskName.isNotEmpty) {
      await RespTask().addTask(taskName);
      loadTask();
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