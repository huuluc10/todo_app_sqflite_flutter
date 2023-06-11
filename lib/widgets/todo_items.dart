// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:todo_app/utils/colors.dart';

import '../models/todo.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    Key? key,
    required this.todo,
    required this.onToDoChange,
    required this.onDeleteItem,
  }) : super(key: key);
  final Todo todo;
  final onToDoChange;
  final onDeleteItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 9,
        left: 14,
        right: 14,
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            onToDoChange(todo);
          },
          icon: Icon(
            todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: blueCustom,
          ),
        ),
        title: Text(
          todo.todoText,
          style: TextStyle(
            fontSize: 16,
            color: blackCustom,
            decoration:
                todo.isDone ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: redCustom,
            borderRadius: BorderRadius.circular(14),
          ),
          child: IconButton(
            color: Colors.white,
            onPressed: () {
              onDeleteItem(todo.id);
            },
            iconSize: 18,
            icon: const Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
