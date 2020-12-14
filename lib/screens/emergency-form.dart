import 'dart:ffi';
import 'dart:io';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:roadsideassistance/const/variables.dart';
import 'package:roadsideassistance/widgets/string_input.dart';
import 'package:roadsideassistance/widgets/disable_string_input.dart';
import 'package:roadsideassistance/widgets/description.dart';
import 'package:roadsideassistance/widgets/submit_button.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


// List<CameraDescription> cameras;//for list of cameras
// cameras= await availableCameras();//accesss camera

class Emergency_form extends StatefulWidget {
  @override
  _Emergency_formState createState() => _Emergency_formState();
}

// class AlwaysDisabledFocusNode extends FocusNode {
//   @override
//   bool get hasFocus => false;
// }

class _Emergency_formState extends State<Emergency_form> {
  TextEditingController vech_reg_num, cust_name, description_;
  File imageFile;
  FlutterLocalNotificationsPlugin fltrNotification;

  _openGallary(BuildContext context) async {
// ignore: deprecated_member_use
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture ;
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
// ignore: deprecated_member_use
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Make a Choice"),
            content: SingleChildScrollView(
              child: ListBody(children: <Widget>[
                GestureDetector(
                  child: Text("Galary"),
                  onTap: () {
                    _openGallary(context);
                  },
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  child: Text("Camera"),
                  onTap: () {
                    _openCamera(context);
                  },
                )
              ]),
            ),
          );
        });
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
   
//     final oldcoordinates = new Coordinates(userlat, userlong);
//     var oldaddresses =
//         await Geocoder.local.findAddressesFromCoordinates(oldcoordinates);
//     var first = oldaddresses.first;
//     var oldadminarea = first.adminArea;

//     final coordinates = new Coordinates(userlat, userlong);
//     var addresses =
//         await Geocoder.local.findAddressesFromCoordinates(coordinates);
//     var Location = addresses.first;
//     var userlocation = Location.locality;
//     await Future.delayed(Duration(seconds: 1));
//     Navigator.pushReplacementNamed(context, '/home', arguments: {
//       'latitude': userlat,
//       'longitude': userlong,
//       'datalocation': datalocation,
//       'userlocation': userlocation
//     });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    vech_reg_num = new TextEditingController();
    cust_name = new TextEditingController();
   // detailed_type = new TextEditingController();
    description_ = new TextEditingController();
    fltrNotification = FlutterLocalNotificationsPlugin();

    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var ios = new IOSInitializationSettings();
    var initilize  = new InitializationSettings(android: android,iOS: ios);
    fltrNotification =  new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initilize, onSelectNotification: notificationSelected);

  }

  Future notificationSelected (String payload){
    if (payload != null){
      debugPrint("Notification: " + payload);
    }
  }

  Future _showNotification() async{
      var androidDetail = new AndroidNotificationDetails('channelId', 'Roadside Assistance', "channelDescription", importance: Importance.max);
      var iOSDetails = new IOSNotificationDetails();
      var generalNotificationDetails = new NotificationDetails(android: androidDetail, iOS: iOSDetails);
      // await fltrNotification.show(0, 'Request Accepted', 'Your request is Accepted', generalNotificationDetails);

    var scheduleTime = DateTime.now().add(Duration(minutes: 1,seconds: 30));
    // fltrNotification.Schedule(0, 'Request Accepted', 'Your request is Accepted',
    //     scheduleTime, generalNotificationDetails);

    fltrNotification.schedule(0, 'Request Accepted', 'Your request is Accepted',
              scheduleTime, generalNotificationDetails);
  }



// Widget _decideImageView(){
//   if(imageFile == null){
//     return Text("No image selected !");
//   }else{
//     Image.file(imageFile,width: 400,height :400);
//   }
// }
Map data;
var cardtext='';
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
   cardtext = (data['card_text']);
    print(cardtext);
    return Scaffold(
        backgroundColor: Colors.red,
        body: SingleChildScrollView(
          child: Padding(

            padding: const EdgeInsets.all(25.0),
            child: Card(
              elevation: 10.0,
              shadowColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              color: Colors.grey[50],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: String_Input(
                      label_text: "Name",
                      controller_text: cust_name,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: String_Input(
                      label_text: "Vechicle Registration Number",
                      controller_text: vech_reg_num,
                    ),
                  ),
                  RaisedButton(
                    elevation: 10.0,
                    onPressed: () {

                      _showChoiceDialog(context);

                    },
                    child: Text(
                      'Take/Choose Picture',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    color: Colors.redAccent,
                    textColor: Colors.white,
                  ),
                   
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Problem Type - $cardtext",)
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: description(
                      label_text: "Description",
                      controller_text: description_,
                    ),
                  ),
                  RaisedButton(
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
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Container(
                      height: 40.0,
                      child: GestureDetector(
                        onTap: () {
                          _showNotification();
                          EmergencyForm();

                          
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(5.0),
                          shadowColor: Colors.red,
                          color: Colors.redAccent,
                          elevation: 13.0,
                          child: Center(
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0)
// ),_decideImageView(),
                ],
              ),
            ),
          ),
        ));
  }

  Future EmergencyForm() async {
    var url = Variable.URL + "emergencyform.php";
    var response = await http.post(url, body: {
      "cust_name": cust_name.text,
      "vech_reg_num": vech_reg_num.text,
      "detailed_type": cardtext,
      "description": description_.text,
      "Latitude": userlat.toString(),
      "Longitude": userlong.toString(),
      "accepted_requested":'0',
      "Service_provider_name":'0',
      "phone_number":'0',
    });
    
    var result = (response.body).trim();
    print(result+',,,,,,,');
    if (result == 'Successful'){
      Fluttertoast.showToast(
        msg: "Request send successfully",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      Navigator.of(context).pushReplacementNamed('/customer_dashboard');
    }
    else{
      Fluttertoast.showToast(
        msg: "Error! Please Try Again",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}




