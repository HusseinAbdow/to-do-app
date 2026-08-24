import 'dart:async';

import 'config.dart';
import 'package:postgres/postgres.dart';

class DBHelper {
  PostgreSQLConnection? _connection;

  Future<void> connect() async {
    if (_connection != null && _connection!.isClosed == false) {
      return;
    }

    _connection = PostgreSQLConnection(
      dbHost,
      dbPort,
      dbName,
      username: dbUser,
      password: dbPassword,
    );

    await _connection!.open();
    print("Connected to db sir! LETS GET THE JOB DONE");

    // check if  table exists
    await _connection!.query('''
      CREATE TABLE IF NOT EXISTS tasks (
        id SERIAL PRIMARY KEY,
        task TEXT NOT NULL,
        completed BOOLEAN DEFAULT false
      )
    ''');
  }

  Future<List<Map<String, dynamic>>> getTasks() async {
    await connect();
    final results = await _connection!.query("SELECT * FROM tasks");
    return results
        .map((row) => {"id": row[0], "task": row[1], "completed": row[2]})
        .toList();
  }

  Future <void> addTask(String task) async{
    await connect();
    await _connection!.query("INSERT INTO tasks (task, completed) VALUES(@task, @completed)",
    substitutionValues: {"task": task, "completed": false}
    );
    print("the task $task has been added");
  }

  Future <void> updateTask (int id, bool completed) async{
    await connect();
   await _connection!.query("UPDATE tasks SET completed = @completed WHERE id = @id",
   substitutionValues: {"completed": completed, "id":  id}
   );
   print("the task completion  has been updated to $completed");
  }
    Future <void> deleteTask(int id) async{
      await connect();
      await _connection!.query("DELETE FROM tasks WHERE id = @id",
      substitutionValues: {"id": id}
      );
      print("the task with id $id has been deleted");
    }

}

// Future<void> main() async {
//   // DBHelper dbHelper = DBHelper();
//   //  await dbHelper.connect();
//   // //  await dbHelper.addTask("smile");

//   // final tasks = await dbHelper.getTask();
//   // for (var task in tasks) {
//   //   print(task);
//   // }
//   // await dbHelper.updateTask(6, true);
//   // await dbHelper.deleteTask(4);

//   //  final tasks2 = await dbHelper.getTask();
//   // for (var task in tasks2) {
//   //   print(task);
//   // }

  

// }
