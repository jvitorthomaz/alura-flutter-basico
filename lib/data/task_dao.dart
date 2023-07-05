
import 'package:alura_flutter1/data/database.dart';
import 'package:sqflite/sqlite_api.dart';

import '../components/task.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
    '$_name TEXT, '
    '$_difficulty INTEGER, '
    '$_image TEXT ';

  static const String  _tablename = 'taskTable';
  static const String  _name = 'name';
  static const String  _difficulty = 'difficulty';
  static const String  _image = 'image';

  save(Task tarefa) async{
    print('Iniciando o Save...');

    final Database bancoDedados = await getDatabase();
    var itemExists = await find(tarefa.nome);
    Map<String, dynamic> taskMap = convertToMap(tarefa);

    if(itemExists.isEmpty){
      print('Não existe uma tarefa com esse nome');
      return await bancoDedados.insert(_tablename, taskMap);

    } else{
      print('Já existe uma terefa com esse nome');
      return await bancoDedados.update(
        _tablename, 
        taskMap ,
        where: '$_name = ?',
        whereArgs: [tarefa.nome],
      );
    }
  }

  Map<String, dynamic> convertToMap(Task tarefa){
    print('convertendo tarefa em Map...');

    final Map<String, dynamic> mapaDeTarefas = {}; // ou Map();

    mapaDeTarefas[_name] = tarefa.nome;
    mapaDeTarefas[_difficulty] = tarefa.dificuldade;
    mapaDeTarefas[_image] = tarefa.foto;

    print('Mapa de tarefas: $mapaDeTarefas');

    return mapaDeTarefas;
  }

  Future<List<Task>> findAll() async{
    print('Acessando o findAll: ');

    final Database bancoDedados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDedados.query(_tablename);

    print('Procurando no banco de dados...');
    print('\nencontrado: $result');

    return convertToList(result);

  }

  List<Task> convertToList(List<Map<String, dynamic>> mapaDeTarefas) {
    print('convertendo to List: ');
    final List<Task> tarefas = [];
    for(Map<String, dynamic> linha in mapaDeTarefas){
      final Task tarefa = Task(nome: linha[_name], foto: linha[_image], dificuldade: linha[_difficulty]);
      tarefas.add(tarefa);
    }
    print('Lista de Tarefas: $tarefas');
    return tarefas;
  }

  Future<List<Task>> find(String nomeDaTarefa)async{
     print('Acessando o find: ');
     final Database bancoDedados = await getDatabase();
     final List<Map<String, dynamic>> result = await bancoDedados.query(
      _tablename, 
      where: '$_name = ?', 
      whereArgs: [nomeDaTarefa],
    );
     print('Tarefa encontrada: ${convertToList(result)}');
     return convertToList(result);

  }

  delete(String nomeDaTarefa) async{
    print('Deletando tarefa: $nomeDaTarefa');
    final Database bancoDedados = await getDatabase();
    return bancoDedados.delete(_tablename, where: '$_name = ?', whereArgs: [nomeDaTarefa]);

  }
  
}
