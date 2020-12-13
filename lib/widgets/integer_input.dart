

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Integer_Input extends StatelessWidget {

  Integer_Input({this.label_text,this.controller_text});

  final String label_text;
  final controller_text;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        controller: controller_text,
        autofocus: true,
        validator: RequiredValidator(errorText: "* Required"),
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

      ),
    );
  }
}