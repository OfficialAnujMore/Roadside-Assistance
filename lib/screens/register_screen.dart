import 'package:flutter/material.dart';
import 'customer_register.dart';
import 'service_provider_register.dart';
void main() => runApp(RegisterScreen());
class RegisterScreen extends StatefulWidget {
  @override
  _Register_ScreenState createState() => _Register_ScreenState();
}

class _Register_ScreenState extends State<RegisterScreen> {

  List<Widget> containers = [
    Customer_registeration(),
    ServiceProvider(),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Register"),
          bottom: TabBar(
            tabs: [
              Tab(text: "Customer"),
              Tab(text: "Service Provider"),
            ],
          ),
        ),
          body: TabBarView(
            children: containers,),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'customer_register.dart';
//
// class RegisterScreen extends StatefulWidget {
//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }
//
// class _RegisterScreenState extends State<RegisterScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: DefaultTabController(
//         length: choices.length,
//         child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.red,
//             title: const Text('Register'),
//             bottom: TabBar(
//               isScrollable: false,
//               tabs: choices.map<Widget>((Choice choice) {
//                 return Tab(
//                   text: choice.title,
//                   icon: Icon(choice.icon),
//                 );
//               }).toList(),
//             ),
//           ),
//           body: Customer_registeration(),
//
//         ),
//       ),
//     );
//   }
// }
//
//
//
// class Choice {
//   final String title;
//   final IconData icon;
//   const Choice({this.title, this.icon});
// }
//
// const List<Choice> choices = <Choice>[
//   Choice(title: 'Customer', icon: Icons.directions_car),
//
//   Choice(title: 'Service Provider', icon: Icons.build),
// ];
