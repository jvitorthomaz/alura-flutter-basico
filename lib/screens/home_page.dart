import 'package:alura_flutter1/data/task_inherited.dart';
import 'package:alura_flutter1/screens/components/task.dart';
import 'package:alura_flutter1/screens/form_screeen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {


  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: const Text('Tarefas', ),
        ),
        body: ListView(
          children: TaskInherited.of(context)!.taskList,
        ),
        floatingActionButton: FloatingActionButton(
         child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (contextNew) => FormScreeen(taskContext: context,)),
            );
          },
        ),
      );
  }
}