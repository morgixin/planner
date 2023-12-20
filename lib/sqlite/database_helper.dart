import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/user.dart';

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

    Database db = await openDatabase(path, version: 1, onCreate: _onCreateDb);
    return db;
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

  //Function methods

  //Authentication
  Future<bool> authenticate(User usr) async {
    final Database db = await initDb();
    var result = await db.rawQuery(
        "select * from users where email = '${usr.email}' AND usrPassword = '${usr.password}' ");
    if (result.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  //Sign up
  Future<int> createUser(User usr) async {
    final Database db = await initDb();
    return db.insert("user", usr.toMap());
  }

  //Get current User details
  Future<User?> getUser(String usrEmail) async {
    final Database db = await initDb();
    var res = await db.query("user", where: "email = ?", whereArgs: [usrEmail]);
    return res.isNotEmpty ? User.fromMap(res.first) : null;
  }
}
