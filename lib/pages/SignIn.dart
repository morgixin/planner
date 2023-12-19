import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInScreenHome();
}

class _SignInScreenHome extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(toolbarHeight: 0,),
      body: _SignInScreen(context),
    );
  }
}

Widget _SignInScreen(context) {
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
        Text('teste cadastro')
      ]),
  );
}