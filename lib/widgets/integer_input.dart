import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Integer_Input extends StatelessWidget {

  Integer_Input({this.label_text,this.controller_text});

  final String label_text;
  final controller_text;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller_text,
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