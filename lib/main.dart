import 'package:flutter/material.dart';
import 'screens/splashscreen.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}

