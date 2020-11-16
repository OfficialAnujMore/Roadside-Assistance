import 'package:flutter/material.dart';
import 'package:roadsideassistance/widgets/submit_button.dart';

void main() => runApp(LoginScreen());

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Column(

          children: [
            Container(
              padding: EdgeInsets.only(top: 50.0),
              child: Stack(
                children: [
                  Container(
                    child: Image(
                      image: AssetImage('assets/preview_image.png'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 0.0, left: 20.0, right: 20.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'EMAIL',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'PASSWORD',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    alignment: Alignment(1.0,0.0),
                    padding: EdgeInsets.only(left: 20.0 , top:10.0),
                    child: InkWell(
                      child: Text("Forgot Password",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline
                      ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    height: 40.0,
                    child: Submit_Button(button_text: 'Login',),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text("New to Assitance?",
                          style: TextStyle(fontSize: 15.0),),
                        ),
                        SizedBox(width: 5.0),
                        Container(
                          child: InkWell(
                            onTap: (){
                              Navigator.of(context).pushNamed('/register');
                            },
                            child: Text("Register",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline
                              ),
                            ),

                          ),
                        ),
                        SizedBox(height: 50.0,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

      ),

    );
  }
}

