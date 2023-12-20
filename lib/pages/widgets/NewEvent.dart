// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventCreator extends StatefulWidget {
  EventCreator({super.key});

  @override
  State<EventCreator> createState() => _EventCreatorState();
}

class _EventCreatorState extends State<EventCreator> {
  click() {
    print('aoao');
  }

  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        // toolbarHeight: 140,
        foregroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          //height:MediaQuery.of(context).size.height*0.87,
          padding: const EdgeInsets.only(top: 40),
          decoration: const BoxDecoration(color: Colors.white,
            borderRadius:
              BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),),
          ),
          child: Column( children: [
            SizedBox(width: MediaQuery.of(context).size.width*0.83, 
              child: const Text("Data e hora", style: TextStyle(fontSize: 18),)),
            CupertinoPageScaffold(
              backgroundColor: Colors.transparent,
              child: CupertinoButton(
                color: Colors.white,
                child: Text('${dateTime.day}/${dateTime.month} - ${dateTime.hour}:${dateTime.minute}', 
                  style: TextStyle(color: Theme.of(context).colorScheme.background, fontSize: 18, fontFamily: 'Inter', fontWeight: FontWeight.w600),),
                onPressed: () {
                  showCupertinoModalPopup(context: context, 
                    builder: (BuildContext context) => Container(
                      height: 240,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(38))),
                      child: CupertinoDatePicker(
                          initialDateTime: dateTime,
                          onDateTimeChanged: (DateTime newTime) {
                            setState(() => dateTime = newTime);
                          },
                          use24hFormat: true,
                          mode: CupertinoDatePickerMode.dateAndTime,
                        )),
                    );
                },
              ),
            ),
            SizedBox(height: 20),
          
            SizedBox(width: MediaQuery.of(context).size.width*0.83, 
              child: const Text("Título", style: TextStyle(fontSize: 18),)),
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
                    hintText: 'Digite o nome do evento'),
                ),
              ),
            ),
            SizedBox(height: 20),
          
            SizedBox(width: MediaQuery.of(context).size.width*0.83, 
              child: const Text("Descrição", style: TextStyle(fontSize: 18),)),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.85,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Digite uma descrição breve',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.grey)),),
                ),
              ),
            ),
            SizedBox(height: 20),
        
            SizedBox(width: MediaQuery.of(context).size.width*0.83, 
              child: const Text("Categoria", style: TextStyle(fontSize: 18),)
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.85,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Diga uma categoria para o evento',
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
          
            ElevatedButton(
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
            child: Text("Salvar", style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w900, fontSize: 18, color: Colors.white),),),
            ],
          ),
        ),
      )
    );
  }
}