import 'package:flutter/material.dart';
import 'package:planner/pages/widgets/Dashboard.dart';
import 'package:planner/pages/widgets/DoneTasks.dart';

Widget Concluded(BuildContext context) {
  bool showDetails = false;

  List<List<String>> taskList = [];

  return DoneTasks(
      taskController.getCompletedTasks() as List<Map<String, dynamic>>);
}
