import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/forgot_password.dart';
import 'screens/customer_dashboard.dart';
import 'screens/service_provider_screen.dart';
import 'package:roadsideassistance/screens/emergency-form.dart';
import 'screens/emergency-form.dart';

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

        '/': (context) => Emergency_form(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/forgot_password': (context) => Forgot_passoword(),
        '/customer_dashboard': (context) => Customer_Dashboard(),
        '/esp_dashboard': (context) => ESP_dashboard(),
        '/emergency_form': (context)=> Emergency_form(),

      },
    );
  }
}
