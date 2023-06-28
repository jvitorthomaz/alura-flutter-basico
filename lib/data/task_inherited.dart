import 'package:flutter/material.dart';

import '../components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key, required this.child
  }) : super(child: child);

  final Widget child;

  final List<Task> taskList = [
    Task(
      nome: 'Andar de Bike',
      foto:'assets/images/bike_image.webp',
      dificuldade: 3,
    ),
    Task(
      nome: 'Aprender Flutter',
      foto:'assets/images/dash_image.png',
      dificuldade: 1,
    ),
    Task(
      nome: 'Meditar',
      foto:'assets/images/meditacao_image.jpeg',
      dificuldade: 5,
    ),
    Task(
      nome: 'Ler',
      foto:'assets/images/book_image.jpeg',
      dificuldade: 2,
    ),
    Task(
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
