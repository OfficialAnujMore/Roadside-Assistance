import 'package:flutter/material.dart';

void main() =>runApp(SplashScreen());

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text("SplashScreen"),
          ],
        ),

      ),
    );
  }
}

