import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../sqlite/database_helper.dart';

class TaskPlannerController {
  DatabaseHelper dbHelper = DatabaseHelper();

  // Criar novo quadro de tarefas
  createTaskBoard(String name, int color) async {
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

  // Adicionar uma tarefa específica
  addTask(int userId, int boardId, String title, String note, String date,
      String startTime, String endTime, int isCompleted) async {
    var db = await dbHelper.db;
    String sql =
        "INSERT INTO task(user_id, board_id, title, note, date, startTime, endTime, isCompleted) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
    List<dynamic> values = [
      userId,
      boardId,
      title,
      note,
      date,
      startTime,
      endTime,
      isCompleted
    ];
    await db.rawInsert(sql, values);
  }

  // Obter tarefas para um usuário e quadro de tarefas específicos
  Future<List<Map<String, dynamic>>> getTasksForBoard(
      int userId, int boardId) async {
    var db = await dbHelper.db;
    String sql = "SELECT * FROM task WHERE user_id = ? AND board_id = ?";
    List<dynamic> values = [userId, boardId];
    return await db.rawQuery(sql, values);
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
