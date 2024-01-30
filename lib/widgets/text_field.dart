import 'package:flutter/material.dart';

class CTextBox extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  const CTextBox(
      {
        super.key,
        required this.hintText,
        required this.obscureText,
        required this.controller
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),

            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey),
            ),
            fillColor: Colors.grey.shade100,
            filled: true
        ),
      ),
    );
  }
}

