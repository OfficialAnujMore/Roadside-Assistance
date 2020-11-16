import 'package:flutter/material.dart';

class Submit_Button extends StatelessWidget {
  Submit_Button({this.button_text, this.path});
  final String button_text, path;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(path);
      },
      child: Material(
        borderRadius: BorderRadius.circular(20.0),
        shadowColor: Colors.red,
        color: Colors.redAccent,
        elevation: 7.0,
        child:Center(
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
