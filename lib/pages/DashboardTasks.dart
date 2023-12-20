import 'package:flutter/material.dart';
import 'package:planner/pages/widgets/NewEvent.dart';
import 'package:planner/pages/widgets/Tasks.dart';

class DashboardTasks extends StatefulWidget {
  List<List<String>>? list;
  String? name;

  DashboardTasks({super.key, this.list, this.name});

  @override
  State<DashboardTasks> createState() => _DashboardTasksState();
}

class _DashboardTasksState extends State<DashboardTasks> {
  // int _counter = 0;
  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  // int _selectedIndex = 0;
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  // List<Widget> _widgetOptions = <Widget>[ Boards(), Next(), Concluded(), Profile() ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        toolbarHeight: 140,
        foregroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Bom dia,", style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.7),
                      fontWeight: FontWeight.w300,
                      fontSize: 18),),
                  Text("daniel!", style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.bold,
                      fontSize: 28),),
                  const SizedBox(height: 20,),
                  Text("Confira o que há em ${widget.name}", style: const TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.7),
                      fontWeight: FontWeight.w300,
                      fontSize: 18),)
                ],
              ),
              IconButton(onPressed: () => print('asd'), icon: Icon(Icons.search))
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20),
        decoration: const BoxDecoration(color: Colors.white,
          borderRadius:
            BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),),
        ),
        child: Tasks(widget.list!)),
      floatingActionButton: FloatingActionButton(
        onPressed: () { Navigator.push(context,  MaterialPageRoute(builder: (context) => EventCreator())); },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
