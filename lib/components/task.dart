import 'package:alura_flutter1/components/difficulty.dart';
import 'package:alura_flutter1/data/task_dao.dart';
import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;
  Task({super.key, required this.nome, required this.foto, required this.dificuldade});

  int nivel = 0;
  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  

  assetOrNetwork(){
    if (widget.foto.contains('http')) {
      return false;
    } else {
      return true;
    }
   
  }

  @override
  Widget build(BuildContext context) {
    return  Padding( 
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 4), 
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8) , 
            topRight: Radius.circular(8), 
            bottomLeft: Radius.circular(8), 
            bottomRight: Radius.circular(8) 
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(4)
              ),
              height: 140,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(4)
                        ),
                        width: 72,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: assetOrNetwork() ? 
                          Image.asset(
                            widget.foto,
                            fit: BoxFit.cover,
                          )
                          :
                          Image.network(
                            widget.foto,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              widget.nome,
                              style: const TextStyle(fontSize: 24,),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Difficulty(dificultyLevel: widget.dificuldade),
                        ],
                      ),
                      SizedBox(
                        height: 52,
                        width: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              widget.nivel++;
                            });
                          }, 
                          onLongPress: () {
                            TaskDao().delete(widget.nome);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Icon(Icons.arrow_drop_up),
                              Text('UP')
                            ],
                          )
                        ),
                      ),
                      SizedBox(width: 5,)
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: widget.dificuldade > 0 ? (widget.nivel/widget.dificuldade)/10 : 1,

                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Nivel: ${widget.nivel}', style: const TextStyle(color: Colors.white, fontSize: 16)),
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
