import 'package:flutter/material.dart';
import 'package:flutter_to_do_application/util/dialog.dart';
import 'package:flutter_to_do_application/util/to_do_tile.dart';
import 'package:flutter_to_do_application/configs/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  final db = DBHelper();

  List<Map<String, dynamic>> toDoList = [];

  @override
  void initState() {
    super.initState();
    _initDb();
  }

  Future<void> _initDb() async {
      await db.connect();
      print("Database connected");
      await loadTasks();
    } 

  Future<void> loadTasks() async {
    final tasks = await db.getTasks();
    setState(() {
      toDoList = tasks;
    });
  }

  void checkBoxChanged(bool? completed, int index) async {
    final task = toDoList[index];
    await db.updateTask(task["id"], completed ?? false);
    await loadTasks();
  }

  Future<void> saveTask() async {
    final navigator = Navigator.of(context);
    if (_controller.text.trim().isEmpty) return;
    await db.addTask(_controller.text.trim());
    _controller.clear();
    await loadTasks();
    navigator.pop();
  }

  void removeTask(index) async {
    final task = toDoList[index];
    await db.deleteTask(task["id"]);
    await loadTasks();
  }

  void dialogToAddTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogPage(
          controller: _controller,
          onSave: saveTask,
          onCancel: Navigator.of(context).pop,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do", style: TextStyle(fontSize: 35)),
      ),
      backgroundColor: const Color.fromRGBO(243, 246, 245, 1),
      body: toDoList.isEmpty
          ? const Center(
              child: Text("No tasks yet", style: TextStyle(fontSize: 18)),
            )
          : ListView.builder(
              itemCount: toDoList.length,
              itemBuilder: (context, index) {
                final task = toDoList[index];
                return ToDoTile(
                  taskName: task["task"],
                  taskCompleted: task["completed"],
                  onChanged: (value) => checkBoxChanged(value, index),
                  deleteFunction: (context) {
                    removeTask(index);
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(1, 79, 13, 1),
        child: const Icon(Icons.add, color: Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onPressed: dialogToAddTask,
      ),
    );
  }
}
