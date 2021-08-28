import 'package:elder_eate/constant.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: pHeaderTabColor,
          title: const Text(
            'โปรไฟล์',
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              CircleAvatar(
                radius: size.width * 0.2,
                backgroundColor: pButtonColor,
                child: Text(
                  "Profile",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      color: sBackgroundColor),
                  height: size.height * 0.08,
                  width: size.width * 0.85,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.favorite,
                          color: Colors.pink,
                          size: 24.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text("ธิดาพร ชาวคูเวียง"),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: size.height * 0.015,
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      color: sBackgroundColor),
                  height: size.height * 0.08,
                  width: size.width * 0.85,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.favorite,
                          color: Colors.pink,
                          size: 24.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text("65"),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: size.height * 0.015,
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      color: sBackgroundColor),
                  height: size.height * 0.08,
                  width: size.width * 0.85,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.favorite,
                          color: Colors.pink,
                          size: 24.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text("170"),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: size.height * 0.015,
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      color: sBackgroundColor),
                  height: size.height * 0.08,
                  width: size.width * 0.85,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.favorite,
                          color: Colors.pink,
                          size: 24.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text("16/12/2542"),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: size.height * 0.015,
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      color: sBackgroundColor),
                  height: size.height * 0.08,
                  width: size.width * 0.85,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.favorite,
                          color: Colors.pink,
                          size: 24.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text("โรคเบาหวาน"),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: size.height * 0.04,
              ),
              Container(
                width: size.width * 0.25,
                decoration: BoxDecoration(),
                child: TextButton(
                  onPressed: () {
                    print("object");
                  },
                  child: Text(
                    "แก้ไข",
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
