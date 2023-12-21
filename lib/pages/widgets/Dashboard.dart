import 'package:flutter/material.dart';
import 'package:planner/pages/widgets/Dashboard.dart';
import 'package:planner/controller/TaskController.dart';
import 'package:planner/pages/DashboardTasks.dart';

TaskPlannerController taskController = TaskPlannerController();

Widget Boards(BuildContext context) {
  return FutureBuilder<List<Map<String, dynamic>>>(
    future: taskController.getAllTaskBoards(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return CircularProgressIndicator();
      } else if (snapshot.hasError) {
        return Text("Erro ao carregar dados.");
      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
        return Text("Nenhum quadro de tarefas encontrado.");
      } else {
        return Center(
          child: ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Color? colour;
              switch (snapshot.data![index]['color']) {
                case 0:
                  colour = Theme.of(context).colorScheme.primary;
                  break;
                case 1:
                  colour = Theme.of(context).colorScheme.secondary;
                  break;
                case 2:
                  colour = Theme.of(context).colorScheme.tertiary;
                  break;
                case 3:
                  colour = Theme.of(context).colorScheme.surface;
                  break;
              }

              return Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: colour,
                  ),
                  child: TextButton(
                    onPressed: () async {
                      int boardId = snapshot.data![index]['id'];
                      List<Map<String, dynamic>> taskList = await taskController
                          .getTasksByBoardId(boardId.toString());
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashboardTasks(
                            list: [snapshot.data![index]],
                            name: snapshot.data![index]['name'],
                            taskList: taskList
                                .map((task) => task['title'].toString())
                                .toList(),
                          ),
                        ),
                      );
                    },
                    child: Board(snapshot.data![index], context),
                  ),
                ),
              );
            },
          ),
        );
      }
    },
  );
}

Widget Board(Map<String, dynamic> board, context) {
  String boardLength =
      '0'; // Defina boardLength com base nos dados do banco de dados.

  return Column(
    children: [
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                board['name'],
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              if (boardLength != '1')
                Text(
                  "$boardLength tarefas",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                )
              else
                Text(
                  "$boardLength tarefa",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
            ],
          ),
        ),
      ),
    ],
  );
}
