import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:sqflite_common_ffi_web/src/sw/constants.dart';

class DatabaseHelper {
  static final tableName = "user";
  final databaseName = "auth.db";
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  static Database? _db;

  factory DatabaseHelper() => _instance;

  DatabaseHelper.internal();

  Future<Database> get db async {
    return _db ??= await initDb();
  }

  Future<Database> initDb() async {
    final databasePath = await getDatabasesPath();

    final path = join(databasePath, "data.db");

    return await openDatabase(path, version: 1, onCreate: _onCreateDb);
  }

  void _onCreateDb(Database db, int version) async {
    await db.execute(user);
    await db.execute(task_board);
    await db.execute(task);
  }

  //Tables

  //Don't put a comma at the end of a column in sqlite

  String user = """
      CREATE TABLE user (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name VARCHAR NOT NULL,
        email VARCHAR NOT NULL,
        password VARCHAR NOT NULL
      )
    """;

  String task_board = """
      CREATE TABLE task_board(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name VARCHAR NOT NULL,
        color INTEGER NOT NULL
      );
    """;

  String task = """
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
    """;
}
