import 'package:flutter/material.dart';
import 'package:todoapp_yt/screens/home.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do App',
   
       home: Home(),
    );
  }
}
