import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/selector_screen.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/selector': (context) => SelectorScreen(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}
