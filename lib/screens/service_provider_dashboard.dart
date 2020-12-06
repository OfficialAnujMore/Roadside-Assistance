import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:roadsideassistance/const/textstyle.dart';


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
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10,10,10,0),
              height: 240,
              width: double.maxFinite,
              child: Card(
                color: Colors.white,
                shadowColor: Colors.red,
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        // Image(
                        //   height: 150.0,
                        //   width: 150.0,
                        //   image: AssetImage('assets/broke_car.png'),
                        // ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Anuj More", style:TextStyle(
                                fontFamily: 'Roboto Light',
                                fontSize: 25.0,
                                color: Colors.red,
                                fontWeight: FontWeight.bold)),
                            Text("MH 04 CX 164",style: Custom_style.esp_card,),
                            Text("Flat Tire",style: Custom_style.esp_card,),
                            Text("Sion",style: Custom_style.esp_card,),

                          ],
                        ),

                      ],
                    ),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          onPressed: (){

                          },
                          child:Row(
                            children:[
                              Text("Accept ",style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.green,
                                fontFamily: 'Roboto Light',
                                fontWeight: FontWeight.bold
                              ),),
                              Icon(Icons.done_outline,
                                  color:Colors.green),
                            ],
                          ),
                        ),

                        MaterialButton(
                          onPressed: (){

                          },
                          child:Row(
                            children:[
                              Text("Decline ",style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.red,
                                  fontFamily: 'Roboto Light',
                                  fontWeight: FontWeight.bold
                              ),),
                          Icon(Icons.close,
                            color: Colors.red,
                          ),
                            ],
                          ),

                        ),


                      ],
                    ),


                  ],
                ),
              ),

            ),

          ],
        ),
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
