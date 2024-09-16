import 'package:flutter/material.dart';
import 'features/todo_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white70
        ),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 17,
          ),
          bodyLarge: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w700,
            fontSize: 30,
          )
        ),
      ),
      home: const MyHomePage(title: 'Todo List'),
    );
  }
}


