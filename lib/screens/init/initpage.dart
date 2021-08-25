import 'package:elder_eate/constant.dart';
import 'package:flutter/material.dart';

class Init extends StatefulWidget {
  const Init({Key? key}) : super(key: key);

  @override
  _InitState createState() => _InitState();
}

String _text = "“ ควบคุมปริมาณ แคลอรี่ น้ำตาล และ โซเดียม ให้กับคนที่คุณรัก ” ";

class _InitState extends State<Init> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.red,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: size.width * 0.2,
                backgroundColor: pButtonColor,
                child: Text(
                  "LOGO",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  // color: Colors.red,
                  child: Text(
                    _text,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.08,
              ),
              Container(
                width: size.width * 0.45,
                decoration: BoxDecoration(),
                child: TextButton(
                  onPressed: () {
                    print("object");
                  },
                  child: Text(
                    "เริ่มต้นใช้งาน",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
