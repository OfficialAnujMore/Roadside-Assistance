import 'package:flutter/material.dart';
import 'package:roadsideassistance/const/variables.dart';
import 'package:roadsideassistance/widgets/email_input.dart';
import 'package:roadsideassistance/widgets/string_input.dart';
import 'package:roadsideassistance/widgets/integer_input.dart';
import 'package:roadsideassistance/widgets/password_input.dart';
import 'package:roadsideassistance/widgets/submit_button.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';

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

   var userlat = 0.0;
  var userlong = 0.0;
  var datalocation;
  void getCurrentLocation() async {
    var Position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    userlat = Position.latitude;
    userlong = Position.longitude;
    print('$userlat' + '$userlong');


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
                  Email_Input(label_text: "EMAIL",controller_text: esp_email,),
                  Integer_Input(label_text: "PHONE NUMBER",controller_text:esp_phone_number),
                  SizedBox(
                    height: 15.0,
                  ),RaisedButton(
                    elevation: 10.0,
                    onPressed: () {
                      getCurrentLocation();
                    },
                    child: Text(
                      'Fetch Location',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    color: Colors.redAccent,
                    textColor: Colors.white,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Password_Input(label_text: "PASSWORD",controller_text: esp_password,),
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
    var url = Variable.URL +"service_provider_register.php";
    var response = await http.post(url,body:{
      "email" : esp_email.text,
      'garage_name' : esp_garage_name.text,
      'phone_number' : esp_phone_number.text,
      'latitude' : userlat.toString(),
      'longitude' : userlong.toString(),
      "password" : esp_password.text,
    });

    var result = (response.body).trim();
    print(result+',,,,,,,');
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

