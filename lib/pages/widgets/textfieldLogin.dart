//Our custom textfield

import 'package:flutter/material.dart';
import 'package:planner/colors.dart';

class InputField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool passwordInvisible;
  final TextEditingController controller;
  const InputField(
      {super.key,
      required this.hint,
      required this.icon,
      required this.controller,
      this.passwordInvisible = false});

  @override
  Widget build(BuildContext context) {
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
        ),
      ),
    );
  }
}
