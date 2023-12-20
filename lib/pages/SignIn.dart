// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../sqlite/database_helper.dart';
import '../JSON/users.dart';
import 'widgets/textfieldLogin.dart';
import '../pages/Login.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInScreenHome();
}

class _SignInScreenHome extends State<SignIn> {
  final email = TextEditingController();
  final usrName = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final db = DatabaseHelper();

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
                  'Cadastro',
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
                    "Nome de usuário",
                    style: TextStyle(fontSize: 18),
                  )),
              InputField(
                  hint: "Digite aqui um apelido...",
                  icon: Icons.account_circle,
                  controller: usrName),
              SizedBox(height: 20),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.83,
                  child: Text(
                    "E-mail",
                    style: TextStyle(fontSize: 18),
                  )),
              InputField(
                  hint: "Digite aqui seu e-mail",
                  icon: Icons.email,
                  controller: email),
              SizedBox(height: 20),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.83,
                  child: Text(
                    "Senha",
                    style: TextStyle(fontSize: 18),
                  )),
              InputField(
                  hint: "Digite aqui sua senha",
                  icon: Icons.lock,
                  controller: password,
                  passwordInvisible: true),
              SizedBox(height: 20),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.83,
                  child: Text(
                    "Confirme sua senha",
                    style: TextStyle(fontSize: 18),
                  )),
              InputField(
                  hint: "Digite aqui sua senha",
                  icon: Icons.lock,
                  controller: confirmPassword,
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
                    var userExists = await db.authenticate(
                        Users(email: email.text, password: password.text));
                    if (userExists) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Erro de Cadastro'),
                          content: Text(
                              'Usuário já existe. Tente um nome diferente.'),
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
                    } else {
                      var res = await db.createUser(Users(
                          email: email.text,
                          usrName: usrName.text,
                          password: password.text));
                      if (res > 0) {
                        if (!mounted) return;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      }
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Me juntar",
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
