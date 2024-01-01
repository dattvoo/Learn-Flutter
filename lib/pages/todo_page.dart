import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learn_flutter/components/dialog_box.dart';
import 'package:learn_flutter/components/todo_tile.dart';
import 'package:learn_flutter/data/database.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
//  Reference he hive Box
  final _mybox = Hive.box('todobox');

// variable
  // Text controller
  final _controller = TextEditingController();
  // List of todo
  TodoDatabase db = TodoDatabase();
  @override
  void initState() {
    if (_mybox.get("TODOLIST") == null) {
      db.createInitData();
    } else {
      db.loadDatabase();
    }

    // If it is a first time ever opening the app, then create default data
    super.initState();
  }

  // method
  // Checkbox was tapped.
  void checkBoxChange(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
  }

  void saveNewTask() {
    String? newTask = _controller.text;
    setState(() {
      db.todoList.add([newTask, false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
    db.updateDatabase();
  }

  // Create new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("My todo apppppp")),
          backgroundColor: Colors.yellow,
        ),
        backgroundColor: Colors.yellow[200],
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          backgroundColor: Colors.yellow,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
              taskName: db.todoList[index][0],
              taskComplete: db.todoList[index][1],
              onChanged: (value) => checkBoxChange(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          },
        ));
  }
}
