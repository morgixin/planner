import 'package:flutter/material.dart';
import 'package:planner/pages/widgets/Tasks.dart';

Widget Next() {
  bool showDetails = false;

  List<List<String>> taskList = [
    ['0', 'Reunião de desenvolvimento', '10:00 - 11:00', 'Remoto'], 
    ['1', 'Reunião de planejamento', '10:00 - 11:00', 'Remoto'], 
    ['1', 'Reunião de asd', '10:00 - 11:00', 'Remoto'], 
    ['1', 'Reunião de wer', '10:00 - 11:00', 'Remoto'], 
    ['1', 'Reunião de qse', '10:00 - 11:00', 'Presencial'], 
    ['2', 'Reunião de suporte web', '10:00 - 11:00', 'Remoto'], 
    ['2', 'Reunião de suporte web', '10:00 - 11:00', 'Remoto'], 
    ['3', 'Aula de yoga', '10:00 - 11:00', 'Presencial'], 
    ['3', 'Aula de yoga', '10:00 - 11:00', 'Presencial'], 
  ];

  return Tasks(taskList.take(7).toList());
}

