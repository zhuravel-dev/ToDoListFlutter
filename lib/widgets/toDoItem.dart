import 'package:flutter/material.dart';

import '../model/todo_model.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;

  const ToDoItem({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8.0),
      child: ListTile(
          onTap: () {
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          tileColor: Colors.white,
          title: Text(
            todo.todoText!,
            style: TextStyle(
              fontSize: 16,
              color: Colors.green,
            ),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete_forever, color: Colors.green),
            onPressed: () {
            },
          )),
    );
  }
}