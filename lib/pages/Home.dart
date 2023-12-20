import 'package:flutter/material.dart';

import 'package:planner/pages/widgets/NewEvent.dart';
import 'package:planner/pages/widgets/Profile.dart';
import 'package:planner/pages/widgets/Next.dart';
import 'package:planner/pages/widgets/Dashboard.dart';
import 'package:planner/pages/widgets/Concluded.dart';
import 'package:planner/controller/LoginController.dart';
import 'package:planner/pages/widgets/Tasks.dart';
import '../model/user.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.user});
  final User? user;
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _widgetOptions = <Widget>[
    Boards(),
    Next(),
    Concluded(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: Colors.white,
        toolbarHeight: 140,
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
                  Text("${widget.user!.name}!", style: TextStyle(
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
              IconButton(onPressed: () => print('asd'), icon: Icon(Icons.search)),
            ],
          ),
        ),),
      body: Container(
        padding: const EdgeInsets.only(top: 20),
        decoration: const BoxDecoration(color: Colors.white,
          borderRadius:
            BorderRadius.only( topLeft: Radius.circular(18), topRight: Radius.circular(18),),
        ),
        child: _widgetOptions.elementAt(_selectedIndex)
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { Navigator.push(context,  MaterialPageRoute(builder: (context) => EventCreator())); },
        tooltip: 'Add new event',
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
