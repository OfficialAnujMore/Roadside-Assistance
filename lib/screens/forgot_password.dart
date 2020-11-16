import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:roadsideassistance/widgets/string_input.dart';
import 'package:roadsideassistance/widgets/password_input.dart';
import 'package:roadsideassistance/widgets/submit_button.dart';

class Forgot_passoword extends StatefulWidget {
  @override
  _Forgot_passowordState createState() => _Forgot_passowordState();
}

class _Forgot_passowordState extends State<Forgot_passoword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Stack(
                children: [
                  Container(child: Image(image: AssetImage("assets/forgot_password.png")),)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              child: Column(
                children: [
                  String_Input(label_text: "EMAIL",),
                  Password_Input(label_text: "NEW PASSWORD",),
                  Password_Input(label_text: "CONFIRM PASSWORD",),
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                    height: 40.0,
                    child: Submit_Button(button_text: 'Submit',path: '/login',),
                  )

                ],
              ),
            ),
            SizedBox(height: 50.0,)

          ],
        ),
      ),
    );
  }
}
