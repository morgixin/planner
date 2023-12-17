import 'package:flutter/material.dart';
import 'package:planner/pages/Task.dart';

Widget Tasks(context) {
  List<List<String>> list = [
    ['0', 'Reunião de desenvolvimento', '10:00 - 11:00', 'Remoto'], 
    ['1', 'Reunião de planejamento', '10:00 - 11:00', 'Remoto'], 
    ['2', 'Reunião de suporte web', '10:00 - 11:00', 'Remoto'], 
    ['3', 'Aula de yoga', '10:00 - 11:00', 'Presencial'], 
    ['2', 'Live da Ismeiow', '10:00 - 11:00', 'Presencial'], 
    ['2', 'Live da Ismeiow', '10:00 - 11:00', 'Presencial'], 
    ['2', 'Live da Ismeiow', '10:00 - 11:00', 'Presencial'], 
  ];

  return Container(
    decoration: const BoxDecoration(color: Colors.white, 
      borderRadius: 
        BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),),
      ),
    child: Center (
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left:18, right:18, top:18),
            child: Task(list[index], context),
          );
        }),
    ),
  );
}
