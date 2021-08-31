import 'package:elder_eate/constant.dart';
import 'package:flutter/material.dart';

class Individual extends StatefulWidget {
  const Individual({Key? key}) : super(key: key);

  @override
  _IndividualState createState() => _IndividualState();
}

String _text = "ปริมาณพลังงานต่อวัน";

class _IndividualState extends State<Individual> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  child: Text(
                    _text,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.5,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(40.0),
                      color: sBackgroundColor),
                  height: size.height * 0.08,
                  width: size.width * 0.85,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.favorite,
                          color: Colors.pink,
                          size: 24.0,
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text("แคลอรี่ 2000 กิดลแคลอรี่",
                                style: Theme.of(context).textTheme.headline2)),
                      ],
                    ),
                  )),
              SizedBox(
                height: size.height * 0.03,
              ),
              Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.5,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(40.0),
                      color: sBackgroundColor),
                  height: size.height * 0.08,
                  width: size.width * 0.85,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.favorite,
                          color: Colors.pink,
                          size: 24.0,
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text("น้ำตาล 500 กรัม",
                                style: Theme.of(context).textTheme.headline2)),
                      ],
                    ),
                  )),
              SizedBox(
                height: size.height * 0.03,
              ),
              Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.5,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(40.0),
                      color: sBackgroundColor),
                  height: size.height * 0.08,
                  width: size.width * 0.85,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.favorite,
                          color: Colors.pink,
                          size: 24.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text("โซเดียม 300 กรัม",
                              style: Theme.of(context).textTheme.headline2),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: size.height * 0.07,
              ),
              Container(
                width: size.width * 0.39,
                decoration: BoxDecoration(),
                child: TextButton(
                  onPressed: () {
                    print("object");
                  },
                  child: Text(
                    "เริ่มต้นใช้งาน",
                   style: Theme.of(context).textTheme.headline5,
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
