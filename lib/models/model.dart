import 'dart:ffi';

class TodoList{
  TodoList({
    required this.title,
    required this.description,
    required this.status,
    required this.id
});
  final String title;
  final String description;
  final bool status;
  final int id;
}