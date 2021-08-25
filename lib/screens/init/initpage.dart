import 'package:flutter/material.dart';

class Init extends StatefulWidget {
  const Init({ Key? key }) : super(key: key);

  @override
  _InitState createState() => _InitState();
}

class _InitState extends State<Init> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
        Text("ควบคุมปริมาณ แคลอรี่ น้ำตาล และโซเดียม ให้กับคนที่คุณรัก");
        ];
      ),
    );
  }
}