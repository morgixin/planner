import 'package:flutter/material.dart';
import 'package:planner/pages/Welcome.dart';

Widget Profile (BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        SizedBox(height:12),
        const Text("Deseja mesmo deslogar?", style: TextStyle(fontSize: 18),),
        SizedBox(height:10),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.error),
            foregroundColor: MaterialStatePropertyAll(Colors.white),
            padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 20, vertical: 10))
          ),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Welcome()), 
              (Route<dynamic> route) => false);
        }, child: const Text('Sim, quero deslogar!', style: TextStyle(fontSize: 14),))
      ],
    ),
  );
}