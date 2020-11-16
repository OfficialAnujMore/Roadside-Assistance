import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(DashboardScreenCustomer());

class DashboardScreenCustomer extends StatefulWidget {
  @override
  _DashboardScreenCustomerState createState() =>
      _DashboardScreenCustomerState();
}

class _DashboardScreenCustomerState extends State<DashboardScreenCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.red,
        title: Center(
            child: Text(
              "Dashboard",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
        leading: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.menu,
            color: Colors.grey,
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Image.asset(
                  'assets/Notification_bell.JPG',
                  height: 55,
                  width: 35,
                ),
              )),
        ],
      ),
      body: SingleChildScrollView(

        child: Column(
          children: [
            Container(
              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height:150,
                    width: double.infinity,
                    child:Card(
                      color: Colors.red,
                      child: new InkWell(
                          onTap: () {
                            print("tapped");
                          },
                          child: Container(
                              width: 100.0,
                              height: 100.0,
                      ),
                    ),
                  ),
                  ),
                ],
              ),
            ),
          ],
        ),
        //
      ),
    );
  }
}




//
// SafeArea(
// child: Column(
// children: <Widget>[
// Row(
// crossAxisAlignment: CrossAxisAlignment.center,
// children: <Widget>[
// Container(
// child: Column(
// children: <Widget>[
// Expanded(child: Image.asset(
// 'assets/Notification_bell.JPG',
// height: 100,
// width: 100,
// ),flex: 2,),
// Expanded(child: Text('sdsd')),
// ],
// ),
// ),
// Container(),
// ],
// ),
// Row(
// children: <Widget>[],
// ),
// Row(
// children: <Widget>[],
// ),
// ],
// ),
// ),