import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:roadsideassistance/const/variables.dart';
import 'package:roadsideassistance/widgets/string_input.dart';
import 'package:roadsideassistance/widgets/integer_input.dart';
import 'package:roadsideassistance/widgets/password_input.dart';
import 'package:roadsideassistance/widgets/submit_button.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:roadsideassistance/widgets/email_input.dart';


void main() => runApp(Customer_registeration());

class Customer_registeration extends StatefulWidget {
  @override
  _Customer_registerationState createState() => _Customer_registerationState();
}

class _Customer_registerationState extends State<Customer_registeration> {


  TextEditingController cust_email, cust_name, cust_password;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cust_email = new TextEditingController();
    cust_name = new TextEditingController();
    cust_password = new TextEditingController();


  }
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
                      image: AssetImage('assets/customer.png'),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: 0.0, left: 20.0, right: 20.0),
              child: Column(
                children: [

                  String_Input(label_text: "NAME",controller_text: cust_name,),
                  Email_Input(label_text: "EMAIL",controller_text: cust_email,),
                  Password_Input(label_text: "PASSWORD",controller_text: cust_password,),
                  Password_Input(label_text: "CONFIRM PASSWORD",),
                  SizedBox(height: 20.0,),
                  Container(
                    height: 40.0,
                    child: GestureDetector(
                      onTap: (){
                        register();
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.red,
                        color: Colors.redAccent,
                        elevation: 7.0,
                        child:Center(
                          child: Text(
                            "Register",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
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




  Future register()async{
    var url = Variable.URL +"customer_register.php";
    var response = await http.post(url,body:{
      "email" : cust_email.text,
      "name" : cust_name.text,
      "password" : cust_password.text,
    });

    var result = (response.body).trim();


    if (result == 'Successful'){
      Fluttertoast.showToast(
        msg: "Registration successful",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      Navigator.of(context).pushNamed('/login');
    }
    else{
      Fluttertoast.showToast(
        msg: "Already Registered",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}







