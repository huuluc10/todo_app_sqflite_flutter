import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'package:todo_app/models/todo.dart';

class SQLQueries {
  static final SQLQueries instance = SQLQueries._();
  static Database? _database;

  SQLQueries._();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String databasePath = await getDatabasesPath();
    String dir = path.join(databasePath, 'todo_app.db');

    return await openDatabase(dir, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Todo(
        id TEXT PRIMARY KEY,
        todoText TEXT,
        isDone INTEGER
      )
    ''');
  }

  static Future<List<Todo>> getAllTodos() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query('Todo');
    return List.generate(maps.length, (index) {
      return Todo.fromMap(maps[index]);
    });
  }

  static Future<void> insertTodo(Todo todo) async {
    Database db = await instance.database;
    await db.insert('Todo', todo.toMap());
  }

  static Future<void> updateTodo(Todo todo) async {
    Database db = await instance.database;
    await db.update(
      'Todo',
      {'isDone': !todo.isDone},
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  static Future<void> deleteTodoById(String id) async {
    Database db = await instance.database;
    await db.delete('Todo', where: 'id = ?', whereArgs: [id]);
  }
}
