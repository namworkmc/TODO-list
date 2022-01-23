import 'package:flutter/material.dart';
import 'package:todo_list/TodoContainer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TEST",
      home: Builder(builder: (BuildContext context) {
        return const TodoContainer();
      }),
    );
  }
}
