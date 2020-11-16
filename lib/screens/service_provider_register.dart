import 'package:flutter/material.dart';
import 'package:roadsideassistance/widgets/string_input.dart';
import 'package:roadsideassistance/widgets/integer_input.dart';
import 'package:roadsideassistance/widgets/password_input.dart';
import 'package:roadsideassistance/widgets/submit_button.dart';

void main() => runApp(ServiceProvider());


class ServiceProvider extends StatefulWidget {
  @override
  _ServiceProviderState createState() => _ServiceProviderState();
}

class _ServiceProviderState extends State<ServiceProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    child: Image(
                      image: AssetImage('assets/service_provider.png'),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: 0.0, left: 20.0, right: 20.0),
              child: Column(
                children: [
                  String_Input(label_text: "NAME",),
                  String_Input(label_text: "EMAIL",),
                  Integer_Input(label_text: "PHONE NUMBER"),
                  Integer_Input(label_text: "LOCATION"),
                  Password_Input(label_text: "PASSWORD",),
                  Password_Input(label_text: "CONFIRM PASSWORD",),
                  SizedBox(height: 20.0,),
                  Container(
                    height: 40.0,
                    child: Submit_Button(button_text: 'Register',path: '/login',),
                  ),




                ],
              ),
            ),
            SizedBox(height: 50.0,),

          ],
        ),
      ),
    );
  }
}
