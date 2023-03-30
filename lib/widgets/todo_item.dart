import 'package:flutter/material.dart';
import 'package:todo/model/todo.dart';

class ToDoitem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;

  const ToDoitem({Key? key, required this.onDeleteItem, required this.onToDoChanged, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        leading:  Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: const Color(0xFF5F52EE),
        ),
        title: Column(
          children: [
            Text(
                todo.todoText!,
                style: TextStyle(
                  decoration: todo.isDone? TextDecoration.lineThrough : null,
                )
            ),
          ],
        ),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: const Color(0xFFDA4040),
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: const Icon(Icons.delete),
            onPressed: () {
              onDeleteItem(todo.id);
            },
          ),
        ),
      ),
    );
  }
}
