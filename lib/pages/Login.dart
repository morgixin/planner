import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginScreenHome();
}

class _LoginScreenHome extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(toolbarHeight: 0,),
      body: _LoginScreen(context),
    );
  }
}

Widget _LoginScreen(context) {
  return Container(
    alignment: Alignment.center,
    // decoration: ,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BackButton(onPressed: () {
          Navigator.pop(context);
        },),
        Text("Teste login")
      ]),
  );
}