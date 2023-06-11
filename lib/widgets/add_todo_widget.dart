import 'package:flutter/material.dart';
import '../utils/colors.dart';

Row AddTodoItem(TextEditingController addItemController, dynamic addItem) {
  return Row(
    children: [
      Expanded(
        child: Container(
          margin: const EdgeInsets.only(
            bottom: 20,
            left: 20,
            right: 20,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 0.0),
                blurRadius: 10,
                spreadRadius: 0,
              ),
            ],
            borderRadius: BorderRadius.circular(9),
          ),
          child: TextField(
            controller: addItemController,
            decoration: const InputDecoration(
              hintText: 'Add a new todo item',
              border: InputBorder.none,
              hintStyle: TextStyle(
                color: greyCustom,
              ),
            ),
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(
          bottom: 20,
          right: 20,
        ),
        child: ElevatedButton(
          onPressed: () {
            addItem(addItemController.text);
            addItemController.clear();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: blueCustom,
            minimumSize: const Size(60, 60),
            elevation: 10,
          ),
          child: const Text(
            '+',
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ],
  );
}
