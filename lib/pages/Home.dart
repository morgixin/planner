import 'package:flutter/material.dart';
import 'package:planner/pages/widgets/Boards.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

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

  int _selectedIndex = 2;
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
              SizedBox(width: MediaQuery.of(context).size.width*0.49),
              const Icon(Icons.more_vert, color: Colors.white,),
            ],
          ),
        ),),
      body: Boards(context),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 32,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.access_time), label: 'Recentes', backgroundColor: Colors.white,),
          BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Concluída', backgroundColor: Colors.white,),
          BottomNavigationBarItem(icon: Icon(Icons.label_outline_rounded), label: 'Boards', backgroundColor: Colors.white,),
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
