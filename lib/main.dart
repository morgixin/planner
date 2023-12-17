import 'package:flutter/material.dart';
import 'package:planner/pages/widgets/Tasks.dart';

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
