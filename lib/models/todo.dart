import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Todo {
  String id;
  String todoText;
  bool isDone;

  Todo({
    required this.id,
    required this.todoText,
    required this.isDone,
  });

  static List<Todo> todoList() {
    return [
      Todo(id: '1', todoText: 'Check mail', isDone: true),
      Todo(id: '2', todoText: 'Check bank', isDone: false),
      Todo(id: '3', todoText: 'Continue learn flutter', isDone: false),
      Todo(id: '4', todoText: 'Chatting', isDone: false),
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'todoText': todoText,
      'isDone': isDone,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'] as String,
      todoText: map['todoText'] as String,
      isDone: map['isDone'] == 1,
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) =>
      Todo.fromMap(json.decode(source) as Map<String, dynamic>);
}
