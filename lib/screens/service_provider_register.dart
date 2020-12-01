import 'package:flutter/material.dart';
import 'package:roadsideassistance/widgets/string_input.dart';
import 'package:roadsideassistance/widgets/integer_input.dart';
import 'package:roadsideassistance/widgets/password_input.dart';
import 'package:roadsideassistance/widgets/submit_button.dart';
import 'package:http/http.dart' as http;

void main() => runApp(ServiceProvider());


class ServiceProvider extends StatefulWidget {
  @override
  _ServiceProviderState createState() => _ServiceProviderState();
}

class _ServiceProviderState extends State<ServiceProvider> {

  TextEditingController esp_email, esp_garage_name, esp_phone_number, esp_location,esp_password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    esp_email = new TextEditingController();
    esp_garage_name = new TextEditingController();
    esp_phone_number = new TextEditingController();
    esp_location = new TextEditingController();
    esp_password = new TextEditingController();
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
                  String_Input(label_text: "GARAGE NAME",controller_text: esp_garage_name,),
                  String_Input(label_text: "EMAIL",controller_text: esp_email,),
                  Integer_Input(label_text: "PHONE NUMBER",controller_text:esp_phone_number),
                  String_Input(label_text: "LOCATION",controller_text: esp_location,),
                  Password_Input(label_text: "PASSWORD",controller_text: esp_password,),
                  Password_Input(label_text: "CONFIRM PASSWORD",),
                  SizedBox(height: 20.0,),
                  Container(
                    height: 40.0,
                    child: GestureDetector(
                      onTap: (){
                        Service_provider_register(esp_email.text, esp_garage_name.text,esp_phone_number.text,esp_location.text,esp_password.text);
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

  void Service_provider_register(String esp_email, String esp_garage_name, String esp_phone_number, esp_location, esp_password){
    var url = "http://192.168.0.101/roadside_assistance/service_provider_register.php";
    var data = {"email":esp_email, "garage_name":esp_garage_name, "phone_number":esp_phone_number, "location":esp_location, "password":esp_password};
    var res = http.post(url,body: data);
  }
}
