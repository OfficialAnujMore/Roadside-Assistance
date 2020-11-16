import 'package:flutter/material.dart';

class ClickableCard extends StatelessWidget {
  ClickableCard({this.color, this.label, this.file_name, this.path});

  final Color color;
  final String label, file_name, path;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, '/login');
      },
      child: SingleChildScrollView(
        child: Card(
          elevation: 0.0,
          color: color,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                child: Image(
                  image: AssetImage('assets/' + file_name),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
                child: Text(
                  label,
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
