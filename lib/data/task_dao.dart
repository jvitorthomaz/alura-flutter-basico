
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

  save(Task tarefa){

  }

  Future<List<Task>> findAll() async{
    return findAll();
  }

  Future<List<Task>> find(String nomeDaTarefa)async{
    return find(nomeDaTarefa);
  }

  delete(String nomeDaTarefa) async{

  }
  
}
