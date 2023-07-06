import 'package:alura_flutter1/data/task_dao.dart';
import 'package:alura_flutter1/data/task_inherited.dart';
import 'package:alura_flutter1/components/task.dart';
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
          actions: [
            IconButton(
              onPressed: () {
                setState(() {});
              }, 
              icon: const Icon(Icons.refresh)
            ),
          ],
          title: const Text('Tarefas', ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 20),
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(top: 8, bottom: 100),
              child: FutureBuilder<List<Task>>(
                future: TaskDao().findAll(), builder: ((context, snapshot) {
                  List<Task>? items = snapshot.data;
                

                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Center(
                        child: Column(
                          children: const [
                            CircularProgressIndicator(),
                            Text('Carregando...')
                          ],
                        ),
                      );
                      //break;

                    case ConnectionState.waiting:
                    return Center(
                        child: Column(
                          children: const [
                            CircularProgressIndicator(),
                            Text('Carregando...')
                          ],
                        ),
                      );

                      //break;

                    case ConnectionState.active:
                    return Center(
                        child: Column(
                          children: const [
                            CircularProgressIndicator(),
                            Text('Carregando...')
                          ],
                        ),
                      );

                      //break;

                    case ConnectionState.done:
                      if(snapshot.hasData && items != null){
                        if (items.isNotEmpty) {
                          return ListView.builder(itemCount: items.length, itemBuilder: (BuildContext context, int index){
                            final Task tarefa = items[index];
                            return tarefa;
                          });
                          
                        }
                        return Center(
                          child: Column(
                            children: const [
                              Icon(Icons.error_outline, size: 128,),
                              Text(
                                'Não há nenhuma Tarefa',
                                style: TextStyle(fontSize: 32),
                              ),
                            ],
                          ),
                        );
                      }
                      return Center(
                          child: Column(
                            children: const [
                              Icon(Icons.error_outline, size: 128,),
                              Text(
                                'Erro ao carregar Tarefas',
                                style: TextStyle(fontSize: 32),
                              ),
                            ],
                          ),
                      );
                  }
                  //return const Text('Erro desconhecido');
                })
              )
            )
          ),
        ),
        floatingActionButton: FloatingActionButton(
         child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (contextNew) => FormScreeen(taskContext: context,)),
            ).then((value) => setState(() {
              print('Recarregando tela inicial');
            },));
          },
        ),
      );
  }
}