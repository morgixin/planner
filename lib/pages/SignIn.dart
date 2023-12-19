// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
      appBar: AppBar(backgroundColor: Colors.white, foregroundColor: Theme.of(context).colorScheme.error),
      body: _SignInScreen(context),
    );
  }
}

Widget _SignInScreen(context) {
  click() {
    print('ai! me c.licou mane');
  }

  return Container(
    alignment: Alignment.center,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width*0.83,
          child: Text('Cadastro', style: TextStyle(
            color: Theme.of(context).colorScheme.error,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w900,
            fontSize: 40,
            ),
          ),
        ),

        SizedBox(height: 40),

        SizedBox(width: MediaQuery.of(context).size.width*0.83, 
          child: Text("Nome de usuário", style: TextStyle(fontSize: 18),)),
        SizedBox(
          width: MediaQuery.of(context).size.width*0.85,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.grey)),
                hintText: 'Digite aqui um apelido...'),
            ),
          ),
        ),
        SizedBox(height: 20),

        SizedBox(width: MediaQuery.of(context).size.width*0.83, 
          child: Text("E-mail", style: TextStyle(fontSize: 18),)),
        SizedBox(
          width: MediaQuery.of(context).size.width*0.85,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.grey)),
                hintText: 'Digite aqui seu e-mail'),
            ),
          ),
        ),
        SizedBox(height: 20),

        SizedBox(width: MediaQuery.of(context).size.width*0.83, 
          child: Text("Senha", style: TextStyle(fontSize: 18),)),
        SizedBox(
          width: MediaQuery.of(context).size.width*0.85,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Digite aqui sua senha...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.grey)),),
            ),
          ),
        ),
        SizedBox(height: 50),

        SizedBox(
        width: MediaQuery.of(context).size.width*0.83,
        height: 54,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Theme.of(context).colorScheme.error
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              )
            )
          ),
        onPressed: click,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Me juntar", style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w900, fontSize: 18, color: Colors.white),),
            Icon(Icons.chevron_right, color: Colors.white,),
          ],
        ),),
      ),
    ]),
  );
}