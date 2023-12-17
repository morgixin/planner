import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:planner/model/Task.dart';

class TaskHelper {
  static final tableName = "task";
  static Database? _db;
  static final TaskHelper _taskHelper = TaskHelper._internal();

  factory TaskHelper() {
    return _taskHelper;
  }

  TaskHelper._internal();

  initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "task.db");

    Database db = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreateDb
    );

    return db;

  }

  void _onCreateDb(Database db, int version) {
    String sql = """
    CREATE TABLE $tableName(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title VARCHAR NOT NULL,
      done INTEGER
    );
    """;

    db.execute(sql);

  }

  Future<Database?> get db async {
    _db ??= await initDb();

    return _db;
  }

  Future<int> insertTask(Task task) async {
    var database = await db;
    print("Insert Task");

    int result = await database!.insert(
      tableName,
      task.toMap()
    );

    return result;
  }

  Future<int> updateTask(Task task) async {
    var database = await db;

    int result = await database!.update(
      tableName,
      task.toMap(),
      where: "id=?",
      whereArgs: [task.id]
    );

    return result;
  }

  Future<int> deleteTask(int id) async {
    var database = await db;

    int result = await database!.delete(
      tableName,
      where: "id=?",
      whereArgs: [id]
    );

    return result;
  }

  getTasks() async {
    var database = await db;

    String sql = "SELECT * FROM $tableName;";

    List results = await database!.rawQuery(sql);

    return results;
  }
}