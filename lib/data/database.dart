import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List todoList = [];
  final _mybox = Hive.box('todobox');

  // Run this method if it is the time 1st  time ever openning this app

  void createInitData() {
    todoList = [
      ["Learn Nodejs", false],
      ["Learn Flutter", true]
    ];
  }

  // Load database
  void loadDatabase() {
    todoList = _mybox.get('TODOLIST');
  }

  // Update database
  void updateDatabase() {
    _mybox.put("TODOLIST", todoList);
  }
}
