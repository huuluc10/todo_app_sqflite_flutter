import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/repositories/sql_queries.dart';
import 'package:todo_app/utils/colors.dart';
import 'package:todo_app/widgets/search_box.dart';
import 'package:todo_app/widgets/todo_items.dart';
import '../widgets/add_todo_widget.dart';
import '../widgets/appbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController addItemController = TextEditingController();
  List<Todo> _foundTodo = [];
  List<Todo> todoList = [];

  void loadData() async {
    await SQLQueries.getAllTodos().then((value) {
      todoList = value;
      _foundTodo = todoList;
      print(todoList.length);
      print(_foundTodo.length);
      setState(() {}); // Cập nhật giao diện người dùng
    });
  }

  @override
  void initState() {
    loadData();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroudColor,
      appBar: AppBarCustom(),
      body: Column(
        children: [
          SearchBox(_runFilter),
          Expanded(
            child: Stack(
              children: [
                ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                        bottom: 20,
                        left: 20,
                      ),
                      child: const Text(
                        'All ToDos',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    for (Todo todo in _foundTodo)
                      TodoItem(
                        todo: todo,
                        onToDoChange: _handleToDoChange,
                        onDeleteItem: _deleteItem,
                      ),
                  ],
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: AddTodoItem(
                      addItemController,
                      _addItem,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  void _handleToDoChange(Todo todo) async {
    await SQLQueries.updateTodo(todo);
    loadData();
    setState(() {});
  }

  void _deleteItem(String id) async {
    await SQLQueries.deleteTodoById(id);
    loadData();
    setState(() {});
  }

  void _addItem(String todo) async {
    await SQLQueries.insertTodo(Todo(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      todoText: todo,
      isDone: false,
    ));
    loadData();
    setState(() {});
  }

  void _runFilter(String enteredKeyword) {
    List<Todo> rs = [];
    if (enteredKeyword.isEmpty) {
      rs = todoList;
    } else {
      rs = todoList
          .where((element) => element.todoText
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundTodo = rs;
    });
  }
}
