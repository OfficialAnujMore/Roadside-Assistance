import 'package:flutter/material.dart';
import 'package:roadsideassistance/widgets/clickablecard.dart';

void main() => runApp(SelectorScreen());

class SelectorScreen extends StatefulWidget {
  @override
  _SelectorScreenState createState() => _SelectorScreenState();
}

class _SelectorScreenState extends State<SelectorScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClickableCard(
            color: Colors.white,
            label: "Customer",
            file_name: "customer.png",
            path: "Customer",
          ),
          ClickableCard(
            color: Colors.white,
            label: "Service Provider",
            file_name: "service_provider.png",
            path: "Service Provider",
          ),
        ],
      ),
    );
  }
}
