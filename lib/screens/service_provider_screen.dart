import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ESP_dashboard extends StatefulWidget {
  @override
  _ESP_dashboardState createState() => _ESP_dashboardState();
}

class _ESP_dashboardState extends State<ESP_dashboard> {

  String garage_name = "";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdetails();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text("Welcome "+garage_name),
          backgroundColor: Colors.red,
          leading: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () async{
                    final SharedPreferences sp = await SharedPreferences.getInstance();
                    sp.remove('email');
                    Navigator.pushReplacementNamed(context, '/login');

                  },
                  child: Icon(
                    Icons.power_settings_new,
                    color: Colors.white,
                    size: 30.0,
                  ),
                )),
          ]
      ),

    );
  }

  Future getdetails() async {
    SharedPreferences sp =await SharedPreferences.getInstance();
    setState(() {
      garage_name = sp.getString('garage_name');
      print('...'+garage_name);

    });


  }
}
