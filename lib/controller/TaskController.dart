import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planner/model/User.dart';
import 'package:planner/pages/DashboardTasks.dart';
import 'package:planner/pages/widgets/Dashboard.dart';
import '../sqlite/database_helper.dart';
import '../model/Task.dart';
import '../model/TaskBoard.dart';

class TaskPlannerController {
  DatabaseHelper dbHelper = DatabaseHelper();

  Future<void> addTask(Task task) async {
    var db = await dbHelper.db;
    await db.insert('task', task.toMap());
  }

  Future<void> addBoard(TaskBoard board) async {
    var db = await dbHelper.db;
    await db.insert('task_board', board.toMap());
  }

  Future<List<Map<String, dynamic>>> getTasksByBoardId(String boardId) async {
    var db = await dbHelper.db;
    String sql = "SELECT * FROM task WHERE board_id = ?";
    List<dynamic> values = [boardId];
    return await db.rawQuery(sql, values);
  }

  Future<TaskBoard> getBoardByName(String boardName) async {
    var db = await dbHelper.db;
    var boards =
        await db.query("task_board", where: "name = ?", whereArgs: [boardName]);
    List<TaskBoard> boardList = boards.isNotEmpty
        ? boards.map((e) => TaskBoard.fromMap(e)).toList()
        : [];
    return await boardList[0];
    ;
  }

  Future<List<Task>> getTasksForBoard(int userId, int boardId) async {
    var db = await dbHelper.db;
    String sql = "SELECT * FROM task WHERE user_id = ? AND board_id = ?";
    List<dynamic> values = [userId, boardId];
    var result = await db.rawQuery(sql, values);
    return result.map((map) => Task.fromMap(map)).toList();
  }

  // Criar novo quadro de tarefas
  createTaskBoard(TaskBoard taskBoard) async {
    var db = await dbHelper.db;
    String sql = "INSERT INTO task_board(name, color) VALUES(?, ?)";
    List<dynamic> values = [taskBoard.name, taskBoard.color];
    await db.rawInsert(sql, values);
  }

  // Obter todos os quadros de tarefas
  Future<List<Map<String, dynamic>>> getAllTaskBoards() async {
    var db = await dbHelper.db;
    String sql = "SELECT * FROM task_board";
    return await db.rawQuery(sql);
  }

  // outros metodos que da pra adicionar(updateTask, deleteTask, etc.)

  // Método de exemplo para obter tarefas para um mês específico
  Future<List<Map<String, dynamic>>> getTasksForMonth(String month) async {
    var db = await dbHelper.db;
    String sql =
        "SELECT title, note, date, strftime('%d', date) as 'Day' FROM task WHERE strftime('%m', date) = ?";
    List<dynamic> values = [month];
    return await db.rawQuery(sql, values);
  }

  // Método de exemplo para obter tarefas concluídas
  Future<List<Map<String, dynamic>>> getCompletedTasks() async {
    var db = await dbHelper.db;
    String sql = "SELECT * FROM task WHERE isCompleted = 1";
    return await db.rawQuery(sql);
  }

  // Método de exemplo para obter tarefas concluídas
  Future<List<Map<String, dynamic>>> getRecentTasks() async {
    var db = await dbHelper.db;
    String sql =
        "SELECT * FROM task WHERE date BETWEEN date('now') AND date('now', '+7 days')";
    return await db.rawQuery(sql);
  }

  updateTask(Task task, BuildContext context, User user) async {
    if (task.title != "" && task.board_id != "") {
      var database = await dbHelper.db;

      await database!
          .update("task", task.toMap(), where: "id=?", whereArgs: [task.id]);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashboardTasks()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos!')),
      );
    }
  }

  deleteById(int id) async {
    var db = await dbHelper.db;
    await db.rawDelete("DELETE FROM task WHERE id = ${id};");
  }

  deleteTaskBoardById(int id) async {}

  // outros requerimentos também
  // ...
}
