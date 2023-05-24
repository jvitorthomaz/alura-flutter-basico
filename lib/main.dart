import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
      home: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: const Text('Tarefas', ),
        ),
        body: ListView(
          children: const [
            Task(nome: 'Andar de Bike', foto: 'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large' ,),
            Task(nome: 'Aprender Flutter', foto: 'https://tswbike.com/wp-content/uploads/2020/09/108034687_626160478000800_2490880540739582681_n-e1600200953343.jpg'),
            Task(nome: 'Meditar', foto: 'https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg'),
            Task(nome: 'Ler', foto:'https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg'),
            Task(nome: 'Jogar', foto:'https://i.ibb.co/tB29PZB/kako-epifania-2022-2-c-pia.jpg'),
          ],
        ),
        floatingActionButton: FloatingActionButton(
         child: const Icon(Icons.plus_one),
          onPressed: () {
          
          },
        ),
      )
    );
  }
}

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  const Task({super.key, required this.nome, required this.foto});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              color: Colors.blue,
              height: 140,
            ),
            Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.black26,
                        width: 72,
                        height: 100,
                        child: Image.network(
                          widget.foto,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            child: Text(
                              '${widget.nome}',
                              style: TextStyle(fontSize: 24,),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, size: 15, color: Colors.blue),
                              Icon(Icons.star, size: 15, color: Colors.blue),
                              Icon(Icons.star, size: 15, color: Colors.blue),
                              Icon(Icons.star, size: 15, color: Colors.blue),
                              Icon(Icons.star, size: 15, color: Colors.blue),
                            ],
                          )
                        ],
                      ),
                      Container(
                        height: 52,
                        width: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nivel++;
                            });
                          }, 
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(Icons.arrow_drop_up),
                              Text('UP')
                            ],
                          )
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: nivel/10,

                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Nivel: $nivel', style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}