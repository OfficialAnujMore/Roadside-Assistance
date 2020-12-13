import 'package:flutter/material.dart';

class Cust_Dashboard_Cards extends StatelessWidget {

  Cust_Dashboard_Cards({this.card_text1, this.image_path1,this.card_text2, this.image_path2});

  final String card_text1,image_path1,card_text2,image_path2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: 160.0,
          width: 160.0,
          child: GestureDetector(
            onTap: (){
              Navigator.pushNamed(context,'/emergency_form',arguments:{
                'card_text':card_text1 ,
              });
            },
            child: Card(
              elevation: 10.0,
              shadowColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              color: Colors.grey[50],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    image: AssetImage('assets/'+image_path1),
                  ),
                  Text(card_text1, style: TextStyle(fontSize: 18.0),),
                ],
              ),
            ),
          ),
        ),

        SizedBox(
          height: 160.0,
          width: 160.0,
          child: GestureDetector(
            onTap: (){
              Navigator.pushNamed(context,'/emergency_form',arguments:{
                'card_text':card_text2 ,
              });
            },
            child: Card(
              elevation: 10.0,
              shadowColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              color: Colors.grey[50],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    image: AssetImage('assets/'+ image_path2),
                  ),
                  Text(card_text2,style:TextStyle(fontSize: 18.0),),
                ],
              ),
            ),
          ),
        ),

      ],
    );
  }
}