import 'package:elder_eate/constant.dart';
import 'package:flutter/material.dart';

class WeighHeight extends StatefulWidget {
  const WeighHeight({Key? key}) : super(key: key);

  @override
  _WeighHeightState createState() => _WeighHeightState();
}

class _WeighHeightState extends State<WeighHeight> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var pic = 'assets/images/high.png';
    return SafeArea(
        child: Scaffold(
      backgroundColor: pBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(pic),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              height: size.height * 0.08,
              width: size.width * 0.85,
              child: TextField(
                autocorrect: true,
                decoration: InputDecoration(
                  hintText: 'น้ำหนัก',
                  prefixIcon: Icon(Icons.line_weight_rounded),
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
                  hintText: 'ส่วนสูง',
                  prefixIcon: Icon(Icons.accessibility_new_rounded),
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
              height: size.height * 0.05,
            ),
            Container(
              width: size.width * 0.28,
              decoration: BoxDecoration(),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Disease');
                },
                child: Text(
                  "ถัดไป",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
