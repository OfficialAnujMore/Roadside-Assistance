import 'package:flutter/material.dart';

class Submit_Button extends StatelessWidget {
  Submit_Button({this.button_text});
  final String button_text;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20.0),
      shadowColor: Colors.red,
      color: Colors.redAccent,
      elevation: 7.0,
      child:GestureDetector(
        onTap: (){},
        child: Center(
          child: Text(
            button_text,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
