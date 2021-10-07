import 'package:elder_eate/constant.dart';
import 'package:flutter/material.dart';

class Progress extends StatefulWidget {
  const Progress({Key? key}) : super(key: key);

  @override
  _ProgressState createState() => _ProgressState();
}

String _text = "“ กำลังวิเคราะห์ข้อมูลเพื่อหาค่าพลังงานที่เหมาะสมกับคุณ ” ";

class _ProgressState extends State<Progress> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, '/Individual', (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: pBackgroundColor,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            elevation: 0.0),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: size.width * 0.2,
                backgroundColor: pButtonColor,
                child: Text(
                  "80%",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  child: Text(
                    _text,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.08,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
