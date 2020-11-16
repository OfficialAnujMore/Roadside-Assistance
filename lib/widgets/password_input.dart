import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Password_Input extends StatelessWidget {

  Password_Input({this.label_text, this.password});

  final String label_text;
  final bool password;

  @override
  Widget build(BuildContext context) {
    return TextField(
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
      obscureText: true,
    );
  }
}
