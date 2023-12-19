import 'package:flutter/material.dart';

Widget Boards(context) {
  List<List<dynamic>> list = [
    ['0', 'Trabalho'], 
    ['1', 'Autocuidado'], 
    ['2', 'Estudos'], 
    ['3', 'Fitness'], 
  ];

  click (int option) {
    print("oi $option");
  }

  return Container(
    padding: const EdgeInsets.only(top: 20),
    decoration: const BoxDecoration(color: Colors.white,
      borderRadius:
        BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),),
    ),
    child: Center (
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left:16, right:16, top:16),
            child: Board(list[index], context),
          );
        }
      ),
    ),
  );
}

Widget Board(list, context) {
  Color? colour;
  switch (list[0]) {
    case '0':
      colour = Theme.of(context).colorScheme.primary;
      break;
    case '1':
      colour = Theme.of(context).colorScheme.secondary;
      break;
    case '2':
      colour = Theme.of(context).colorScheme.tertiary;
      break;
    case '3':
      colour = Theme.of(context).colorScheme.surface;
      break;
  }

  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: colour,
    ),
    child: TextButton(
      onPressed: () => print("${list[1]}"),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width*0.8,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(list[1], style: const TextStyle(
                      fontFamily: 'Inter', fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black
                    ),),
                  const Text("3 tarefas", style: TextStyle(fontSize: 16, color: Colors.black),)
                ],
              ),
            ),
          ),
        ],
      ),
    ));
}