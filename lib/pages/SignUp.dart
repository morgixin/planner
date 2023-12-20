// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../model/User.dart';
import '../controller/LoginController.dart';
import '../pages/Login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignInScreenHome();
}

class _SignInScreenHome extends State<SignUp> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String? _name, _email, _password;
  late LoginController controller;

  @override
  void initState() {
    super.initState();
    controller = LoginController();
  }

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
              InputField(context, "Digite aqui um apelido",
                  Icons.account_circle, false, _nameController),
              SizedBox(height: 20),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.83,
                  child: Text(
                    "E-mail",
                    style: TextStyle(fontSize: 18),
                  )),
              InputField(context, "Digite aqui seu e-mail", Icons.email, false,
                  _emailController),
              SizedBox(height: 20),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.83,
                  child: Text(
                    "Senha",
                    style: TextStyle(fontSize: 18),
                  )),
              InputField(context, "Digite aqui sua senha", Icons.lock, true,
                  _passwordController),
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
                    String name = _nameController.text;
                    String email = _emailController.text;
                    String password = _passwordController.text;

                    try {
                      User user =
                          (await controller.getLogin(email, password)) as User;
                      if (user.id != -1) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Usuário já existe!')),
                        );
                      } else {
                        User user =
                            User(name: name, email: email, password: password);
                        int res = await controller.saveUser(user);

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Usuário salvo com sucesso!')),
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.toString())),
                      );
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
            if (hint == "Digite aqui um apelido") {
              _name = value;
            } else if (hint == "Digite aqui seu e-mail") {
              _email = value;
            } else if (hint == "Digite aqui sua senha") {
              _password = value;
            }
          },
        ),
      ),
    );
  }
}
