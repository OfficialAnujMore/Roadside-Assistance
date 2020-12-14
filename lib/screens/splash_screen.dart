import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(SplashScreen());

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String finalemail,finaltype;
  @override
  void initState() {
    getvalidationData().whenComplete(() async{
      if (finaltype == 'customer'){
        Timer(
          Duration(seconds: 3),
              () => Navigator.pushReplacementNamed(context, finalemail == null ? '/login': '/customer_dashboard'),
        );
      }
      else{
        Timer(
          Duration(seconds: 3),
              () => Navigator.pushReplacementNamed(context, finalemail == null ? '/login': '/esp_dashboard'),
        );
      }


    });
    super.initState();

  }

  Future getvalidationData() async{
    final SharedPreferences sp = await SharedPreferences.getInstance();

    var obtainedemail = sp.getString('email');
    var obtainedtype = sp.getString('type');
    setState(() {
      finalemail = obtainedemail;
      finaltype = obtainedtype;
    });
    print(finalemail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.red),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: Icon(
                          Icons.build,
                          color: Colors.red,
                          size: 50.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                      ),
                      Text(
                        "Roadside Assistance",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//
