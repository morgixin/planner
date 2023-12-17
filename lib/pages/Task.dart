import 'package:flutter/material.dart';

Widget Task(list, context) {
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
    default:
  }

  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color.fromRGBO(247, 247, 247, 1),
          // border: Border(left: BorderSide(color: Colors.black, width: 4)),
        ),
        child: Row(
          children: [
            Container(
              width: 8,
              height: 110,
              decoration: BoxDecoration(
                color: colour,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), 
                  bottomLeft: Radius.circular(8), ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: 
                  SizedBox (
                    height: 73,
                    width: MediaQuery.of(context).size.width*0.8,
                    child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (c, index) {
                        if (index != 0) {
                          if (index == 1) {
                            return Text( list[index], 
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),);
                          }
                          return Text(list[index]);
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),)
                ],
              ),
            ),
          ],
  );
}