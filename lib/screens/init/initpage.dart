import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Init extends StatefulWidget {
  const Init({Key? key}) : super(key: key);

  @override
  _InitState createState() => _InitState();
}

String _text = "ควบคุมปริมาณ แคลอรี่ น้ำตาล และ โซเดียม ให้กับคนที่คุณรัก";
var pic = 'assets/images/logo.png';

class _InitState extends State<Init> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // CircleAvatar(
              //   radius: size.width * 0.2,
              //   backgroundColor: pButtonColor,
              //   child: Text(
              //     "LOGO",
              //     style: TextStyle(fontSize: 30, color: Colors.white),
              //   ),
              // ),
              Image.asset(pic, width: size.width * 1),
              SizedBox(
                height: size.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  child: Text(
                    _text,
                    style:
                        TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.08,
              ),
              Container(
                width: size.width * 0.45,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/Username');
                  },
                  child: Text(
                    'เริ่มต้นใช้งาน',
                    style: TextStyle(fontSize: 20.sp),
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
