import 'package:hive/hive.dart';

import '../model/todo.dart';


class ToDoDatabase {
  List<ToDo>? todoList = [];

  // reference our box
  final _myBox = Hive.box<List>('todolistbox');

  // run if first time opening app
  void createInitialData() {
    todoList = ToDo.todoList();
  }

  // load the data from database
  void loadData() {
    todoList = _myBox.get('TODOSLIST', defaultValue: [])?.cast<ToDo>();
  }

  // update the database
  void updateDataBase() {
    _myBox.put('TODOSLIST', todoList!);
  }
}