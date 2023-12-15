import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planner',
      theme: ThemeData(
        colorScheme: _colorScheme(context),
        fontFamily: 'Inter',
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Planner Home Page'),
    );
  }
}

ColorScheme _colorScheme(context) {
  return const ColorScheme(
    brightness: Brightness.light, 
    primary: Color.fromRGBO(255, 124, 78, 1), 
    onPrimary: Colors.white, 
    secondary: Color.fromRGBO(255, 138, 136, 1), 
    onSecondary: Colors.black, 
    tertiary: Color.fromRGBO(156, 162, 248, 1),
    onTertiary: Colors.black,
    error: Color.fromRGBO(255, 124, 78, 1),
    onError: Colors.white, 
    background: Color.fromRGBO(90, 66, 92, 1), 
    onBackground: Colors.white, 
    surface: Color.fromRGBO(167, 221, 246, 1), 
    onSurface: Colors.black);
}

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
      // Column(
      //   children: [
          // IconButton(onPressed: _incrementCounter, icon: const Icon(Icons.arrow_drop_down)),
          Tasks(context),
        // ],
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

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

Widget Task(list, context) {
  Color? colour;
  switch (list[0]) {
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
    default:
  }

  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color.fromRGBO(247, 247, 247, 1),
          // border: Border(left: BorderSide(color: Colors.black, width: 4)),
        ),
        child: Row(
          children: [
            Container(
              width: 8,
              height: 110,
              decoration: BoxDecoration(
                color: colour,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), 
                  bottomLeft: Radius.circular(8), ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: 
                  SizedBox (
                    height: 73,
                    width: MediaQuery.of(context).size.width*0.8,
                    child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (c, index) {
                        if (index != 0) {
                          if (index == 1) {
                            return Text( list[index], 
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),);
                          }
                          return Text(list[index]);
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),)
                ],
              ),
            ),
          ],
  );
}