import 'package:alura_flutter1/screens/components/task.dart';
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
        body: AnimatedOpacity(
          opacity: opacidade ? 1 : 0,
          duration: const Duration(milliseconds: 1000),
          child: ListView(
            children: const [
              Task(
                  nome: 'Andar de Bike',
                  foto:
                      'assets/images/bike_image.webp',
                  dificuldade: 3,
                ),
                Task(
                  nome: 'Aprender Flutter',
                  foto:
                      'assets/images/dash_image.png',
                  dificuldade: 1,
                ),
                Task(
                  nome: 'Meditar',
                  foto:
                      'assets/images/meditacao_image.jpeg',
                  dificuldade: 5,
                ),
                Task(
                  nome: 'Ler',
                  foto:
                      'assets/images/book_image.jpeg',
                  dificuldade: 2,
                ),
                Task(
                  nome: 'Jogar',
                  foto: 'assets/images/jogar_image.jpg',
                  dificuldade: 4,
                ),
                SizedBox(
                  height: 80,
                ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
         child: const Icon(Icons.remove_red_eye),
          onPressed: () {
            setState(() {
              opacidade = !opacidade;
            });
          },
        ),
      );
  }
}