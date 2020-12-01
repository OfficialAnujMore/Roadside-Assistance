import 'package:flutter/material.dart';
import 'package:roadsideassistance/widgets/string_input.dart';
import 'package:roadsideassistance/widgets/integer_input.dart';
import 'package:roadsideassistance/widgets/password_input.dart';
import 'package:roadsideassistance/widgets/submit_button.dart';
import 'package:http/http.dart' as http;
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
                  String_Input(label_text: "EMAIL",controller_text: cust_email,),
                  Password_Input(label_text: "PASSWORD",controller_text: cust_password,),
                  Password_Input(label_text: "CONFIRM PASSWORD",),
                  SizedBox(height: 20.0,),
                  Container(
                    height: 40.0,
                    child: GestureDetector(
                      onTap: (){
                        Customer_register(cust_email.text, cust_name.text, cust_password.text);
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

  void Customer_register(String email, String name, String password){
      var url = "http://192.168.0.101/roadside_assistance/customer_register.php";
      var data = {"email":email, "name":name, "password":password};
      var res = http.post(url,body: data);
  }
}







