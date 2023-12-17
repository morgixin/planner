import 'package:flutter/material.dart';

ColorScheme colorScheme(context) {
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