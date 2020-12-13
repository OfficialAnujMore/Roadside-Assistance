import 'package:flutter/material.dart';
import 'package:roadsideassistance/widgets/cust_dashboard_cards.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Customer_Dashboard extends StatefulWidget {
  @override
  _Customer_DashboardState createState() => _Customer_DashboardState();
}

class _Customer_DashboardState extends State<Customer_Dashboard> {

  String name = "";


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
          title: Text("Welcome "+name),
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 15.0,),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    children: [
                      Cust_Dashboard_Cards(
                        card_text1: "Flat Tire",
                        image_path1: 'flat_tire.png',
                        card_text2: "Towing",
                        image_path2: "towing.png",

                      ),
                      SizedBox(height: 20.0,),
                      Cust_Dashboard_Cards(
                        card_text1: "Low Fuel",
                        image_path1: 'low_fuel.png',
                        card_text2: "Locked",
                        image_path2: "car_lock.png",

                      ),
                      SizedBox(height: 20.0,),
                      Cust_Dashboard_Cards(
                        card_text1: "Break Down",
                        image_path1: 'car_break_down.png',
                        card_text2: "Engine Heat",
                        image_path2: "engine_heat.png",

                      ),
                      SizedBox(height: 20.0,),
                      Cust_Dashboard_Cards(
                        card_text1: "Battery Dead",
                        image_path1: 'car_battery.png',
                        card_text2: "Engine Oil",
                        image_path2: "engine_oil.png",

                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Future getdetails() async {
    SharedPreferences sp =await SharedPreferences.getInstance();
    setState(() {
      name = sp.getString('name');

    });


  }

}

