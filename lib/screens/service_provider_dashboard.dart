import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:roadsideassistance/const/textstyle.dart';
import 'package:roadsideassistance/widgets/esp_dashboard_card.dart';
import 'package:roadsideassistance/const/variables.dart';
import 'package:http/http.dart' show get;




class viewCard{ 
final String name,vech_num,issue,accept;
final imagebroken=AssetImage('assets/'+"broke_car"+'.png');

  viewCard({this.name, this.vech_num, this.issue,this.accept});

factory viewCard.fromJson(Map<String,dynamic> jsonData){
  return viewCard(
    name: jsonData['name'],
    vech_num: jsonData['vechicle_number'],
    issue: jsonData['problem_type'],
    accept: jsonData['accepted_requested'],

  );

}

} 


class CustomListView extends StatelessWidget {
  final List<viewCard> viewcards;
CustomListView(this.viewcards);
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: viewcards.length,
      itemBuilder: (context,int currentIndex){
        return createViewItem(viewcards[currentIndex],context);},
            
          );
        }
      
        Widget createViewItem(viewCard viewcard, BuildContext context) {return new ListTile(title: new Card(
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
                  image: AssetImage('assets/'+'broke_car'+'.png'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(viewcard.name, style:TextStyle(
                        fontFamily: 'Roboto Light',
                        fontSize: 25.0,
                        color: Colors.red,
                        fontWeight: FontWeight.bold)),
                    Text(viewcard.vech_num,style: Custom_style.esp_card,),
                    Text(viewcard.issue,style: Custom_style.esp_card,),
                    

                  ],
                ),

              ],
            ),
            Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: (){
                    Fluttertoast.showToast(
                      msg: "Request Accepted",
                      toastLength: Toast.LENGTH_SHORT,
                      backgroundColor: Colors.greenAccent,
                      textColor: Colors.black,
                      fontSize: 16.0,
                    );

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
                    Fluttertoast.showToast(
                      msg: "Request Declined",
                      toastLength: Toast.LENGTH_SHORT,
                      backgroundColor: Colors.redAccent,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
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
      ),);
      }
}


Future <List<viewCard>> downloadJSON() async{
var url = Variable.URL + "viewData.php";
  var response=await get(url);
  if(response.statusCode==200){
    List viewcards=jsonDecode(response.body);
    return viewcards.map((viewcard) => new viewCard.fromJson(viewcard)).toList();
  }
  else{
    throw Exception("Unable to fetch");
  }
}

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


// Future getdata()async{
//   var url = Variable.URL + "viewData.php";
//   var response=await http.get(url);
//   return jsonDecode(response.body);
// }



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
      body: new Center(
        child: new FutureBuilder<List<viewCard>>(future:downloadJSON(),builder:(context,snapshot){
          if(snapshot.hasData ){
            List<viewCard> viewcards=snapshot.data;
            return new CustomListView(viewcards);
          }
          else if (snapshot.hasError){
            return Text('${snapshot.error}');
          }
          return new CircularProgressIndicator();
        }),
        // child: Column(
        //   children: [
        //     Esp_Dashboard_Card(
        //       cust_name: "Anuj MOre",
        //       vehicle_number: "MH 04 CX 164",
        //       issue: "Flat Tire",
        //       image_path:"broke_car" ,


        //     ),Esp_Dashboard_Card(
        //       cust_name: "Amay Naik",
        //       vehicle_number: "MH 04 CX 164",
        //       issue: "Flat Tire",
        //       image_path:"broke_car" ,


        //     ),

        //   ],
        // ),
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
