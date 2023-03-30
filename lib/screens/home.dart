import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/data/database.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/screens/theme_page.dart';
import 'package:todo/widgets/todo_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // reference the hive box
  final _myBox = Hive.box<List>('todolistbox');
  ToDoDatabase db = ToDoDatabase();

  List<ToDo> foundToDo = [];

  final todoController = TextEditingController();


  @override
  void initState () {
    // if first time opening app show initial data
    if (_myBox.get('TODOSLIST')?.cast<ToDo>() == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    foundToDo = db.todoList!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ThemePage(),));
                },
                icon: const Icon(Icons.brightness_4_rounded)
            )
          ],
        ),
      ),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  searchBox(),
                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 50, bottom: 20,),
                          child:  const Text(
                            'Tasks',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                        for ( ToDo todo in foundToDo.reversed )
                          ToDoitem(
                            todo: todo,
                            onToDoChanged: handleToDochange,
                            onDeleteItem: deletToDoitem,
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: 20,
                        right: 20,
                        left: 20
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration:  BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0,0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        style: const TextStyle(
                          color: Color(0xFF030303),
                        ),
                        controller: todoController,
                        decoration: const InputDecoration(
                          hintText: 'Add task',
                          border: InputBorder.none
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20, right: 20),
                    child: ElevatedButton(
                      onPressed: () {addToDoitem(todoController.text);},
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF5F52EE),
                        minimumSize: const Size(60, 60),
                        elevation: 10
                      ),
                      child: const Icon(
                        Icons.add
                      ),
                    ),
                  )
                ],),
            )
          ],
        ));
  }

  void handleToDochange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
    db.updateDataBase();
  }

  void deletToDoitem(String id) {
    setState(() {
      db.todoList!
          .removeWhere(
              (item) => item.id == id
      );
    });
    db.updateDataBase();
  }

  void addToDoitem(String toDo) {
    setState(() {
      db.todoList!
          .add(
          ToDo(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              todoText: toDo
          )
      );
    });
    todoController.clear();
    db.updateDataBase();
  }

  void runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if(enteredKeyword.isEmpty) {
      results = db.todoList!;
    } else {
      results = db.todoList!
          .where((item) => item.todoText!
          .toLowerCase()
          .contains(
          enteredKeyword
              .toLowerCase()))
          .toList();
    }

    setState(() {
      foundToDo = results;
    });
  }

  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
      ),
      child: TextField(
        style: const TextStyle(
          color: Color(0xFF030303),
      ),
        onChanged: (value) => runFilter(value),
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: tdBlack,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(
                maxHeight: 20,
                minWidth: 25
            ),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: tdGrey)
        ),
      ),
    );
  }
}
