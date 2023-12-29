import 'package:flutter/material.dart';
import 'package:learn_flutter/utils/todo_tile.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  // variable
  // List of todo
  List todoList = [
    ["Learn Flutter", false],
    ["Learn Java", true],
  ];
  // method
  // Checkbox was tapped.
  void checkBoxChange(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  // Create new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("My todo apppppp")),
          backgroundColor: Colors.yellow,
        ),
        backgroundColor: Colors.yellow[200],
        floatingActionButton: FloatingActionButton(
          onPressed: () => createNewTask,
          backgroundColor: Colors.yellow,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
              taskName: todoList[index][0],
              taskComplete: todoList[index][1],
              onChanged: (value) => checkBoxChange(value, index),
            );
          },
        ));
  }
}
