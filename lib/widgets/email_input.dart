import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Email_Input extends StatelessWidget {

  Email_Input({this.label_text,this.controller_text});

  final String label_text;
  final controller_text;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        autovalidate: true,
        // autofocus: true,
        controller: controller_text,
        validator: MultiValidator(
          [

            RequiredValidator(errorText: "* Required"),
            EmailValidator(
              errorText: "Not a valid Email"
            ),
          ],
        ),
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