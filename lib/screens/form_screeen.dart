import 'dart:async';

import 'package:alura_flutter1/data/task_inherited.dart';
import 'package:flutter/material.dart';

// url imagem teste: https://ih1.redbubble.net/image.3266012404.3827/st,small,507x507-pad,600x600,f8f8f8.jpg
    
class FormScreeen extends StatefulWidget {
  const FormScreeen({
    Key? key, required this.taskContext
  }) : super(key: key);

  final BuildContext taskContext;

  @override
  _FormScreeenState createState() => _FormScreeenState();
}

class _FormScreeenState extends State<FormScreeen> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  bool valueValidator(String? value){
    if (value != null && value.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool difficultyValidator(String? value){
     if (value != null && value.isEmpty) {
      if (int.parse(value) > 5 || int.parse(value) < 1) {
        return true;
      }
    }
    return false;
    
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nova Tarefa'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 650,
              width: 375,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (valueValidator(value)) {
                          return 'Insira o nome da Tarefa';
                        }
                        return null;
                      },
                      controller: nameController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nome',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
          
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (difficultyValidator(value)) {
                          return 'Insira uma dificuldade entre 1 e 5';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: difficultyController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Deficuldade',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
          
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: ((text) {
                        setState(() {
                        });
                      }),
                      validator: (value) {
                        if (valueValidator(value)) {
                          return 'Insira um url de imagem';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.url,
                      controller: imageController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Imagem',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
          
                    ),
                  ),
                  Container(
                    height: 180,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(width: 2, color: Colors.blue),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageController.text, 
                        
                        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                          return const Icon(Icons.no_photography_outlined, size: 80, color: Colors.white,);
                          //return Image.asset('assets/images/nophoto.png', );
                        },
                        fit: BoxFit.cover,
                      ),
          
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (() async{

                      if (_formKey.currentState!.validate()) {
                        // print(nameController.text);
                        // print(int.parse(difficultyController.text));
                        // print(imageController.text);  

                        TaskInherited.of(widget.taskContext)!.newTask(
                          nameController.text, 
                          imageController.text, 
                          int.parse(difficultyController.text)
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Salvando nova tarefa')),
                        );
          
                        Navigator.pop(context);
                      } else {
                        print('O formulário não foi validado');
                      }
                    
                    
                    }), 
                    child: const Text('Adicionar!'),
                  )
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}