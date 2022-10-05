import 'package:flutter/material.dart';
import '../model/toDoModel.dart';

class ToDoItem extends StatelessWidget {
  final ToDoModel todo;
  final changeToDo;
  final deleteToDo;

  const ToDoItem({
    Key? key,
    required this.todo,
    required this.changeToDo,
    required this.deleteToDo
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8.0),
      child: ListTile(
          onTap: () {
            changeToDo(todo);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          tileColor: Theme.of(context).cardTheme.color,
          leading: Icon(
            todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(
            todo.text,
            style: TextStyle(
              fontSize: 16
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete_forever, color: Theme.of(context).primaryColor),
            onPressed: () {
              deleteToDo(todo);
            },
          )),
    );
  }
}