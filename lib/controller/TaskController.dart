import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../sqlite/database_helper.dart';
import '../model/Task.dart';

class TaskPlannerController {
  DatabaseHelper dbHelper = DatabaseHelper();

  Future<void> addTask(Task task) async {
    var db = await dbHelper.db;
    await db.insert('task', task.toMap());
  }

  Future<List<Map<String, dynamic>>> getTasksByBoardId(String boardId) async {
    var db = await dbHelper.db;
    String sql = "SELECT * FROM task WHERE board_id = ?";
    List<dynamic> values = [boardId];
    return await db.rawQuery(sql, values);
  }

  Future<List<Task>> getTasksForBoard(int userId, int boardId) async {
    var db = await dbHelper.db;
    String sql = "SELECT * FROM task WHERE user_id = ? AND board_id = ?";
    List<dynamic> values = [userId, boardId];
    var result = await db.rawQuery(sql, values);
    return result.map((map) => Task.fromMap(map)).toList();
  }

  // Criar novo quadro de tarefas
  createTaskBoard(String name, String color) async {
    var db = await dbHelper.db;
    String sql = "INSERT INTO task_board(name, color) VALUES(?, ?)";
    List<dynamic> values = [name, color];
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

  // outros requerimentos também
  // ...
}
