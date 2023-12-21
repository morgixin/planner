import 'package:flutter/material.dart';

import 'package:planner/pages/widgets/NewEvent.dart';
import 'package:planner/pages/widgets/Profile.dart';
import 'package:planner/pages/widgets/Next.dart';
import 'package:planner/pages/widgets/Dashboard.dart';
import 'package:planner/pages/widgets/Concluded.dart';

import '../model/User.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.user});
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

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      Boards(context),
      Next(context),
      Concluded(context),
      Profile(context),
    ];

    bool isVisible = true;
    if (_selectedIndex == 3) {
      isVisible = false;
    } else
      isVisible = true;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                  const Text(
                    "Bom dia,",
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.7),
                        fontWeight: FontWeight.w300,
                        fontSize: 18),
                  ),
                  Text(
                    "${widget.user!.id}!",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeight: FontWeight.bold,
                        fontSize: 28),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Confira seus quadros",
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.7),
                        fontWeight: FontWeight.w300,
                        fontSize: 18),
                  )
                ],
              ),
              IconButton(
                  onPressed: () => print('pesquisa clicada'),
                  icon: Icon(Icons.search)),
            ],
          ),
        ),
      ),
      body: Container(
          padding: const EdgeInsets.only(top: 20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
          ),
          child: _widgetOptions.elementAt(_selectedIndex)),
      floatingActionButton: Visibility(
        visible: isVisible,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EventCreator(user: widget.user!)));
          },
          tooltip: 'Add new event',
          child: const Icon(Icons.add),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 32,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.label_outline_rounded),
            label: 'Dashboard',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Recentes',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: 'Concluídas',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tag_faces_rounded),
            label: 'Deslogar',
            backgroundColor: Colors.white,
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.error,
        unselectedItemColor: Colors.black54,
        onTap: _onItemTapped,
      ),
    );
  }
}
