import 'package:flutter/material.dart';
import 'package:roadsideassistance/const/textstyle.dart';


class Esp_Dashboard_Card extends StatelessWidget {
  Esp_Dashboard_Card({this.cust_name,this.vehicle_number,this.issue,this.cust_location,this.image_path});

  String cust_name, vehicle_number, issue, cust_location, image_path;

  @override
  Widget build(BuildContext context) {
    return Container(
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

                Image(
                  height: 150.0,
                  width: 150.0,
                  image: AssetImage('assets/'+image_path+'.png'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cust_name, style:TextStyle(
                        fontFamily: 'Roboto Light',
                        fontSize: 25.0,
                        color: Colors.red,
                        fontWeight: FontWeight.bold)),
                    Text(vehicle_number,style: Custom_style.esp_card,),
                    Text(issue,style: Custom_style.esp_card,),
                    Text(cust_location,style: Custom_style.esp_card,),

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

    );
  }
}