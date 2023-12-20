// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/User.dart';
import 'Home.dart';
import 'package:planner/controller/LoginController.dart';

enum LoginStatus { notSignIn, signIn }

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginScreenHome();
}

class _LoginScreenHome extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  LoginStatus _loginStatus = LoginStatus.notSignIn;
  String? _email, _password;
  final _formKey = GlobalKey<FormState>();
  late LoginController controller;
  dynamic value;

  _LoginScreenHome() {
    this.controller = LoginController();
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      value = preferences.getInt("value");

      _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
    });
  }

  savePref(int value, String user, String pass) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      preferences.setInt("value", value);
      preferences.setString("user", user);
      preferences.setString("pass", pass);
    });
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Theme.of(context).colorScheme.error),
      body: SingleChildScrollView(
        child: Container(
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
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.83,
                            child: Text(
                              "E-mail",
                              style: TextStyle(fontSize: 18),
                            )),
                        InputField(context, "Digite seu e-mail",
                            Icons.account_circle, false, _emailController),
                        SizedBox(height: 20),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.83,
                            child: Text(
                              "Senha",
                              style: TextStyle(fontSize: 18),
                            )),
                        InputField(context, "Digite sua senha", Icons.lock,
                            true, _passwordController)
                      ],
                    )),
                SizedBox(height: 50),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.83,
                  height: 54,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).colorScheme.error),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ))),
                    onPressed: () async {
                      final form = _formKey.currentState;

                      if (form!.validate()) {
                        form.save();

                        try {
                          User user = (await controller.getLogin(
                              _email!, _password!)) as User;
                          if (user.id != -1) {
                            savePref(1, user.email, user.password);
                            _loginStatus = LoginStatus.signIn;

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage(user: user)),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Usuário não registrado!')),
                            );
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e.toString())),
                          );
                        }
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
      ),
    );
  }

  Widget InputField(BuildContext context, String hint, IconData icon,
      bool passwordInvisible, TextEditingController controller) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          obscureText: passwordInvisible,
          controller: controller,
          decoration: InputDecoration(
              icon: Icon(icon),
              fillColor: Colors.grey,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.grey)),
              hintText: hint),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Campo obrigatório';
            }
            return null;
          },
          onSaved: (value) {
            if (hint == 'Digite seu e-mail') {
              _email = value;
            } else if (hint == 'Digite sua senha') {
              _password = value;
            }
          },
        ),
      ),
    );
  }
}
