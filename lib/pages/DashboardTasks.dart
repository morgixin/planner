import 'package:flutter/material.dart';
import 'package:planner/pages/widgets/Tasks.dart';

class DashboardTasks extends StatefulWidget {
  List<List<String>>? list;

  DashboardTasks({super.key, this.list});

  @override
  State<DashboardTasks> createState() => _DashboardTasksState();
}

class _DashboardTasksState extends State<DashboardTasks> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
            mainAxisAlignment: MainAxisAlignment.center,
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
                  const Text("Confira seus quadros", style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.7),
                      fontWeight: FontWeight.w300,
                      fontSize: 18),)
                ],
              ),
              SizedBox(width: MediaQuery.of(context).size.width*0.36),
              const Icon(Icons.more_vert),
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
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 32,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.label_outline_rounded), label: 'Dashboard', backgroundColor: Colors.white,),
          BottomNavigationBarItem(icon: Icon(Icons.access_time), label: 'Recentes', backgroundColor: Colors.white,),
          BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Concluídas', backgroundColor: Colors.white,),
          BottomNavigationBarItem(icon: Icon(Icons.tag_faces_rounded), label: 'Perfil', backgroundColor: Colors.white,)
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.error,
        unselectedItemColor: Colors.black54,
        onTap: _onItemTapped,
      ),
    );
  }
}
