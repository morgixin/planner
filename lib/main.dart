import 'package:flutter/material.dart';
import 'sqlite/database_helper.dart';
import 'package:planner/colors.dart';
import 'package:planner/pages/Welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper().initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Planner',
      theme: ThemeData(
        colorScheme: colorScheme(context),
        fontFamily: 'Inter',
        useMaterial3: true,
      ),
      home: const Welcome(),
    );
  }
}
