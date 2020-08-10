import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../models/task.dart';

class DbHelper {
  DbHelper._();
  static DbHelper instence = DbHelper._();
  static String tableName = 'task';
  static String idColumnName = 'id';
  static String titleColumnName = 'title';

  static String descriptionColumnName = 'description';

  static String isCompleteColumnName = 'isComplete';
  Database database;
  initDatabase() async {
    if (database == null) {
      database = await connectToDatabase();
      return database;
    } else {
      return database;
    }
  }

  Future<Database> connectToDatabase() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
   
    String dbPath = '$appDocPath/task_database.db';
    Database database = await openDatabase(dbPath, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          '''CREATE TABLE $tableName ($idColumnName INTEGER PRIMARY KEY AUTOINCREMENT,$titleColumnName TEXT ,$descriptionColumnName TEXT,
          $isCompleteColumnName INTEGER)''');
    });
    return database;
  }
  insertTask(Map map)async{
    database=await initDatabase();
    database.insert(tableName, map);
    

  }

  Future <List<Task>>getData()async{
        database=await initDatabase();
     List<Map<String,dynamic>> results= await database.query(tableName);
     List<Task> tasks=results.map((e) => Task.fromJson(e)).toList();
     return tasks;

  }
  updateIscomplete(Task task)async{
    database=await initDatabase();
    database.rawUpdate(
    'UPDATE $tableName SET $isCompleteColumnName = ? WHERE $idColumnName = ?',
    [task.isCompleted?0:1, task.id]);
  }
}
