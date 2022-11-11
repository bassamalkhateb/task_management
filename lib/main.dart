import 'package:flutter/material.dart';
import 'package:task_management/Screen/add_task.dart';
import 'package:task_management/Screen/all_task_screen.dart';
import 'package:task_management/Screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: AllTaskScreen(),
    );
  }
}
