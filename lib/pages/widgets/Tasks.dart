import 'package:flutter/material.dart';
import 'package:planner/pages/widgets/Task.dart';

Widget Tasks(context, List<List<String>> list) {
  return Container(
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
            padding: const EdgeInsets.only(left:18, right:18, top:18),
            child: Task(list[index], context),
          );
        }),
    ),
  );
}
