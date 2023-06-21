import 'package:flutter/material.dart';

import '../screens/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key, required this.child
  }) : super(child: child);

  final Widget child;

  final List<Task> taskList = [
    const Task(
      nome: 'Andar de Bike',
      foto:'assets/images/bike_image.webp',
      dificuldade: 3,
    ),
    const Task(
      nome: 'Aprender Flutter',
      foto:'assets/images/dash_image.png',
      dificuldade: 1,
    ),
    const Task(
      nome: 'Meditar',
      foto:'assets/images/meditacao_image.jpeg',
      dificuldade: 5,
    ),
    const Task(
      nome: 'Ler',
      foto:'assets/images/book_image.jpeg',
      dificuldade: 2,
    ),
    const Task(
      nome: 'Jogar',
      foto: 'assets/images/jogar_image.jpg',
      dificuldade: 4,
    ),
  ];

  void newTask(String name, String photo, int dificulty){
    taskList.add(Task(nome: name , foto: photo , dificuldade: dificulty));  
  }

  static TaskInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskInherited>();
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
