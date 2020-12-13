import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';


class String_Input extends StatelessWidget {
  String_Input({this.label_text,this.controller_text});

  final String label_text;
  final controller_text;

  final _key  = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: TextFormField(
        autovalidate: true,
        // autofocus: true,
        controller: controller_text,

        validator:MultiValidator([
          RequiredValidator(errorText: '* Required'),
          MinLengthValidator(2, errorText: 'Not valid value'),
        ]),
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
      ),
    );
  }
}