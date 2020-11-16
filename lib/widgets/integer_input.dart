import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Integer_Input extends StatelessWidget {

  Integer_Input({this.label_text});

  final String label_text;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration:  InputDecoration(labelText:label_text,
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,

        ),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      ),

      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],

    );
  }
}