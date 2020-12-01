import 'package:flutter/material.dart';


class String_Input extends StatelessWidget {
  String_Input({this.label_text,this.controller_text});

  final String label_text;
  final controller_text;


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller_text,
      decoration: InputDecoration(
        labelText: label_text,
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),

        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}