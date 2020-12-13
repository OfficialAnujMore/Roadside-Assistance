import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:roadsideassistance/widgets/submit_button.dart';
import 'package:roadsideassistance/widgets/string_input.dart';
import 'package:roadsideassistance/widgets/password_input.dart';
import 'package:http/http.dart' as http;
import '../const/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:roadsideassistance/widgets/email_input.dart';

void main() => runApp(LoginScreen());

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController email,password;
  SharedPreferences sp;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    email = new TextEditingController();
    password = new TextEditingController();

  }


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
                  Email_Input(label_text: "Email",controller_text: email,),
                  // String_Input(label_text: "EMAIL",controller_text: email,),
                  SizedBox(height: 20.0),
                  Password_Input(label_text: "PASSWORD",controller_text: password,),
                  SizedBox(height: 5.0),
                  Container(
                    alignment: Alignment(1.0,0.0),
                    padding: EdgeInsets.only(left: 20.0 , top:10.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).pushNamed('/forgot_password');
                      },
                      child: Text("Forgot Password",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline
                      ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    height: 40.0,
                    child: GestureDetector(
                      onTap: (){
                        login();
                        // print("Pressed");
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.red,
                        color: Colors.redAccent,
                        elevation: 7.0,
                        child:Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
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
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0,),
                ],
              ),
            ),
            SizedBox(height: 150.0,),
          ],
        ),

      ),

    );
  }
  Future login()async{
    var url = Variable.URL +"login.php";
    var response = await http.post(url,body:{
      "email" : email.text,
      "password" : password.text,
    });
    var result = jsonDecode(response.body);
    print(result[0]);
    String type = result[0]['type'];

    if (type == 'customer'){

      String email = result[0]['email'];
      String name = result[0]['name'];

      SharedPreferences sp  = await SharedPreferences.getInstance();
      sp.setString('email', email);
      sp.setString('name', name);
      sp.setString('type', type);
      Fluttertoast.showToast(
        msg: "Login Successful",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      Navigator.of(context).pushNamed('/customer_dashboard');
    }
    else if (type == 'esp'){

      String email = result[0]['email'];
      String garage_name = result[0]['garage_name'];
      print(garage_name);

      SharedPreferences sp  = await SharedPreferences.getInstance();
      sp.setString('email', email);
      sp.setString('garage_name', garage_name);
      sp.setString('type', type);
      Fluttertoast.showToast(
        msg: "Login successful",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      Navigator.of(context).pushNamed('/esp_dashboard');

    }
    else{
      Fluttertoast.showToast(
        msg: "Invalid username or password",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }




}



