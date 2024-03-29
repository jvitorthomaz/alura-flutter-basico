import 'package:alura_flutter1/data/task_inherited.dart';
import 'package:alura_flutter1/screens/form_screeen.dart';
import 'package:alura_flutter1/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), // ThemeData
      home: TaskInherited(child: const HomePage(),),
    );
  }
}
