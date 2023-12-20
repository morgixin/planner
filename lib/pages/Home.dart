import 'package:flutter/material.dart';
import 'package:planner/pages/widgets/Tasks.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../sqlite/database_helper.dart';
import '../JSON/users.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, this.profile});
  final String title;
  final Users? profile;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        toolbarHeight: 140,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Bom dia,", style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.7),
                  fontWeight: FontWeight.normal,
                  fontSize: 18),),
              Text("daniel!", style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),),
              const SizedBox(height: 20,),
              const Text("Confira o que temos para hoje", style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.7),
                  fontSize: 18),)
            ],
                ),
        ),),
      body: 
        Tasks(context),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
