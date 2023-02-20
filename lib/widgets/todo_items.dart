import 'package:flutter/material.dart';
import 'package:todoapp_yt/constants/colors.dart';
import '../models/todo.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({
    super.key,
    required this.todo,
    required this.onChangeItem,
    required this.onDeleteItem,
  });

  final ToDo todo;

  final onChangeItem;
  final onDeleteItem;

  @override
  Widget build(Object context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: () {
          onChangeItem(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17),
        ),
        tileColor: todo.isDone == 1 ? bgLightBlue : bgBlue,
        leading: Container(
            child: Icon(
          todo.isDone == 1 ? Icons.check_box : Icons.check_box_outline_blank,
          color: bgWhite,
        )),
        title: Text(
          todo.title,
          style: const TextStyle(
            color: bgWhite,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Container(
          child: IconButton(
            color: bgWhite,
            icon: const Icon(
              Icons.delete,
              size: 20.0,
            ),
            onPressed: () {
              onDeleteItem(todo.id);
            },
          ),
        ),
      ),
    );
  }
}
