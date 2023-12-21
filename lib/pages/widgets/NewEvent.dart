// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planner/controller/TaskController.dart';
import 'package:planner/model/Task.dart';
import 'package:planner/model/User.dart';
import 'package:planner/model/TaskBoard.dart';

class EventCreator extends StatefulWidget {
  final User user;
  EventCreator({super.key, required this.user});

  @override
  State<EventCreator> createState() => _EventCreatorState();
}

class _EventCreatorState extends State<EventCreator> {
  DateTime dateStart = DateTime.now();
  DateTime dateEnd = DateTime.now();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _noteController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _startTimeController = TextEditingController();
  TextEditingController _endTimeController = TextEditingController();

  late TaskPlannerController taskController;

  int? verificarBoard(String name) {
    TaskBoard res = taskController.getBoardByName(name) as TaskBoard;
    if (res.name == name) {
      return res.id;
    } else {
      taskController.addBoard(TaskBoard(
          name: name, color: Theme.of(context).colorScheme.primary.toString()));
      return (taskController.getBoardByName(name) as TaskBoard).id;
    }
  }

  @override
  void initState() {
    super.initState();
    taskController = TaskPlannerController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: 40),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.83,
                child: const Text(
                  "Data e hora",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              CupertinoPageScaffold(
                backgroundColor: Colors.transparent,
                child: CupertinoButton(
                  color: Colors.white,
                  child: Text(
                    '${dateStart.day}/${dateStart.month} - ${dateStart.hour}:${dateStart.minute}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.background,
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) => Container(
                        height: 240,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(38),
                          ),
                        ),
                        child: CupertinoDatePicker(
                          initialDateTime: dateStart,
                          onDateTimeChanged: (DateTime newTime) {
                            setState(() => dateStart = newTime);
                            _dateController.text =
                                "${newTime.year.toString()}-${newTime.month.toString()}-${newTime.day.toString()}";
                            _startTimeController.text =
                                "${newTime.hour.toString()}:${newTime.minute.toString()}:${newTime.second.toString()}";
                          },
                          use24hFormat: true,
                          mode: CupertinoDatePickerMode.dateAndTime,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.83,
                child: const Text(
                  "Título",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      fillColor: Colors.grey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      hintText: 'Digite o nome do evento',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.83,
                child: const Text(
                  "Descrição",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _noteController,
                    decoration: InputDecoration(
                      hintText: 'Digite uma descrição breve',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.83,
                child: const Text(
                  "Categoria",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _categoryController,
                    decoration: InputDecoration(
                      hintText: 'Diga uma categoria para o evento',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).colorScheme.error,
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                onPressed: () => taskController.addTask(Task(
                    widget.user.id!,
                    verificarBoard(_categoryController.text)!,
                    _titleController.text,
                    _noteController.text,
                    DateTime(dateStart.year, dateStart.month, dateStart.day),
                    "${dateStart.hour}:${dateStart.minute}:${dateStart.second}",
                    "${dateEnd.hour}:${dateEnd.minute}:${dateEnd.second}")),
                child: Text(
                  "Salvar",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
