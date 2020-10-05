import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            colors: [
              Colors.red[900],
              Colors.orange[800],
              Colors.red[800],
            ],
          ),
        ),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}

// child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.fromLTRB(10.0, 60.0, 0.0, 0.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   "Login",
//                   style: TextStyle(
//                     fontSize: 30.0,
//                     color: Colors.white,
//                   ),
//                 ),
//                 Text(
//                   "Welcome Back",
//                   style: TextStyle(
//                     fontSize: 30.0,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 30.0,
//           ),
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(40),
//                   topRight: Radius.circular(40),
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   Container(
//                     padding: EdgeInsets.all(20),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
