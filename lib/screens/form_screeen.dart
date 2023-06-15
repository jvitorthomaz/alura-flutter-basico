import 'package:flutter/material.dart';

// url imagem teste: https://ih1.redbubble.net/image.3266012404.3827/st,small,507x507-pad,600x600,f8f8f8.jpg
    
class FormScreeen extends StatefulWidget {
  const FormScreeen({Key? key}) : super(key: key);

  @override
  _FormScreeenState createState() => _FormScreeenState();
}

class _FormScreeenState extends State<FormScreeen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Tarefa'),
      ),
      body: Center(
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
                onPressed: (() {
                  print(nameController.text);
                  print(int.parse(difficultyController.text));
                  print(imageController.text);
                
                }), 
                child: const Text('Adicionar!'),
              )
            ],
          )
        ),
      ),
    );
  }
}