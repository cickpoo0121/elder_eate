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

    return Scaffold(
      backgroundColor: pHeaderTabColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: pHeaderTabColor,
        centerTitle: true,
        title: Text(
          'โปรไฟล์',
          style: Theme.of(context).textTheme.headline1,
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: (ConstrainedBox(
          constraints:
          BoxConstraints(minHeight: size.height, minWidth: size.width),
          child: Container(
            decoration: BoxDecoration(
              color: pBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: size.width * 0.23,
                    backgroundColor: pButtonColor,
                    child: Text(
                      "Profile",
                      style: TextStyle(fontSize: 30, color: Colors.white),
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
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(40.0),
                          color: sBackgroundColor),
                      height: size.height * 0.08,
                      width: size.width * 0.85,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.account_box,
                              color: Colors.black,
                              size: 28,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text("ธิดาพร ชาวคูเวียง",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.5,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
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
                              Icons.line_weight_rounded,
                              color: Colors.black,
                              size: 28,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text("65",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.5,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
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
                              Icons.accessibility_new_rounded,
                              color: Colors.black,
                              size: 28,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text("180",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.5,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
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
                              Icons.date_range_rounded,
                              color: Colors.black,
                              size: 28,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text("15/05/2542",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: size.height * 0.025,
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
                            Icons.elderly_rounded,
                            color: Colors.black,
                            size: 25,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text("โรคเบาหวาน",
                                style: Theme.of(context).textTheme.headline4),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.040,
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
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
