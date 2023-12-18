// Em lib/database/database_helper.dart

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final path = join(await getDatabasesPath(), 'app_database.db');
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE user(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name VARCHAR NOT NULL,
        email VARCHAR NOT NULL,
        password VARCHAR NOT NULL
      );
    ''');

    await db.execute('''
      CREATE TABLE task_board(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name VARCHAR NOT NULL,
        color INTEGER NOT NULL
      );
    ''');

    await db.execute('''
      CREATE TABLE task(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER NOT NULL,
        board_id INTEGER NOT NULL,
        title VARCHAR NOT NULL,
        note TEXT NOT NULL,
        date VARCHAR NOT NULL,
        startTime VARCHAR NOT NULL,
        endTime VARCHAR NOT NULL,
        isCompleted INTEGER,
        FOREIGN KEY(user_id) REFERENCES user(id),
        FOREIGN KEY(board_id) REFERENCES task_board(id)
      );
    ''');
  }

  Future<bool> isValidUser(String username, String password) async {
    final db = await database;
    final result = await db.query(
      'user',
      where: 'name = ? AND password = ?',
      whereArgs: [username, password],
    );
    return result.isNotEmpty;
  }

  Future<int> insertUser(String name, String email, String password) async {
    final db = await database;
    return await db.insert(
      'user',
      {'name': name, 'email': email, 'password': password},
    );
  }
}
