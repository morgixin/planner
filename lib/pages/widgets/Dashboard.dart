import 'package:flutter/material.dart';
import 'package:planner/pages/DashboardTasks.dart';

Widget Boards(context) {
  bool showDetails = false;

  List<List<dynamic>> list = [
    ['0', 'Trabalho'], 
    ['1', 'Autocuidado'],
    ['2', 'Estudos'],
    ['3', 'Fitness'],
  ];

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

  return Center (
    child: ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        Color? colour;
        switch (list[index][0]) {
          case '0':
            colour = Theme.of(context).colorScheme.primary;
            break;
          case '1':
            colour = Theme.of(context).colorScheme.secondary;
            break;
          case '2':
            colour = Theme.of(context).colorScheme.tertiary;
            break;
          case '3':
            colour = Theme.of(context).colorScheme.surface;
            break;
        }
  
        return Padding(
          padding: const EdgeInsets.only(left:16, right:16, top:16),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: colour,
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DashboardTasks(list: taskList.where((e) => e[0] == index.toString()).toList(),))
                );
              },
              child: Board(list[index], context)),
          ),
        );
      }
    ),
  );
}

Widget Board(list, context) {
  return Column(
    children: [
      SizedBox(
        width: MediaQuery.of(context).size.width*0.8,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(list[1], style: const TextStyle(
                  fontFamily: 'Inter', fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black
                ),),
              const Text("3 tarefas", style: TextStyle(fontSize: 16, color: Colors.black),)
            ],
          ),
        ),
      ),
    ],
  );
}
