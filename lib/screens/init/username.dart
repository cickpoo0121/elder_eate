import 'package:elder_eate/constant.dart';
import 'package:flutter/material.dart';

class Username extends StatefulWidget {
  const Username({Key? key}) : super(key: key);

  @override
  _UsernameState createState() => _UsernameState();
}

class _UsernameState extends State<Username> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var pic = 'assets/images/username.png';
    return SafeArea(
        child: Scaffold(
            backgroundColor: pBackgroundColor,
            resizeToAvoidBottomInset: false,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(pic),
              Container(
                     height: size.height * 0.08,
                     width: size.width * 0.85,
                    child: TextField(
                    autocorrect: true,
                    decoration: InputDecoration(
                      hintText: 'ชื่อผู้ใช้',
                      prefixIcon: Icon(Icons.account_box ),
                      hintStyle: TextStyle(color: pRegisTxtColor),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                    ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                     height: size.height * 0.08,
                     width: size.width * 0.85,
                    child: TextField(
                    autocorrect: true,
                    decoration: InputDecoration(
                      hintText: 'อายุ',
                      prefixIcon: Icon(Icons.date_range_rounded ),
                      hintStyle: TextStyle(color: pRegisTxtColor),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                    ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Container(
                    width: size.width * 0.30,
                    decoration: BoxDecoration(),
                    child: TextButton(
                      onPressed: () {
                        print("object");
                      },
                      child: Text(
                        "ถัดไป",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
