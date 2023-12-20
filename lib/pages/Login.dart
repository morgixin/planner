// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../sqlite/database_helper.dart';
import '../JSON/users.dart';
import 'widgets/textfieldLogin.dart';
import 'Home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginScreenHome();
}

class _LoginScreenHome extends State<Login> {
  final email = TextEditingController();
  final password = TextEditingController();

  final db = DatabaseHelper();
  //Login Method
  //We will take the value of text fields using controllers in order to verify whether details are correct or not

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Theme.of(context).colorScheme.error),
      body: Container(
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.83,
                child: Text(
                  'Entrar',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w900,
                    fontSize: 40,
                  ),
                ),
              ),
              SizedBox(height: 40),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.83,
                  child: Text(
                    "E-mail",
                    style: TextStyle(fontSize: 18),
                  )),
              InputField(
                  hint: "Email", icon: Icons.account_circle, controller: email),
              SizedBox(height: 20),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.83,
                  child: Text(
                    "Senha",
                    style: TextStyle(fontSize: 18),
                  )),
              InputField(
                  hint: "Senha",
                  icon: Icons.lock,
                  controller: password,
                  passwordInvisible: true),
              SizedBox(height: 50),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.83,
                height: 54,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).colorScheme.error),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ))),
                  onPressed: () async {
                    Users? usrDetails = await db.getUser(email.text);
                    var res = await db.authenticate(
                        Users(email: email.text, password: password.text));
                    if (res == true) {
                      if (!mounted) return;
                      //If result is correct then go to profile or home
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyHomePage(
                                  title: "Dashboard", profile: usrDetails)));
                    } else {
                      //Otherwise show the error message
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Login Inválido'),
                          content: Text(
                              'Usuário ou senha incorretos. Tente novamente.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Entrar",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
