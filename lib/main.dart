import 'dart:io';

import 'package:flutter/material.dart';
import 'colors.dart';
import 'package:planner/pages/Welcome.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:sqflite_common_ffi_web/src/sw/constants.dart';
import 'package:sqflite/sqflite.dart';

void main() {
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
