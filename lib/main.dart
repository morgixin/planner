import 'package:flutter/material.dart';
import 'colors.dart';
import 'pages/Home.dart';

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
        colorScheme: colorScheme(context),
        fontFamily: 'Inter',
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Planner Home Page'),
    );
  }
}