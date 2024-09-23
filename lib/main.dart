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
      title: 'Todo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white70
        ),
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.grey.withOpacity(0.20),
          filled: true,
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
              color: Colors.black,
              width: 1.2,
            ),
          ),
          hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.3)
          ),
        ),
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(0),
            shape: StadiumBorder(),
            backgroundColor:
            Colors.white70.withOpacity(0.8),
            minimumSize: Size(93, 45)
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.red.withOpacity(0.65),
          size: 33,
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 18.5,
          ),
          bodyLarge: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
          bodySmall: TextStyle(
              color: Colors.white.withOpacity(0.75),
              fontSize: 15,
              fontWeight: FontWeight.w500
          )
        ),
      ),
      home: const MyHomePage(title: 'Todo List'),
    );
  }
}


