import 'package:elder_eate/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeighHeight extends StatefulWidget {
  const WeighHeight({Key? key}) : super(key: key);

  @override
  _WeighHeightState createState() => _WeighHeightState();
}

class _WeighHeightState extends State<WeighHeight> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var pic = 'assets/icons/weighHeight.svg';
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          backgroundColor: pBackgroundColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0.0),
      backgroundColor: pBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: size.height * 0.4,
                  width: size.width * 1,
                ),
                Positioned(
                  child: SvgPicture.asset(
                    pic,
                    width: size.width * 0.7,
                  ),
                  top: 0,
                  right: 0,
                  left: 100,
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  autocorrect: true,
                  decoration: InputDecoration(
                    hintText: 'น้ำหนัก',
                    prefixIcon: Icon(Icons.line_weight_rounded),
                    hintStyle: TextStyle(color: pRegisTxtColor),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  autocorrect: true,
                  decoration: InputDecoration(
                      hintText: 'ส่วนสูง',
                      prefixIcon: Icon(Icons.accessibility_new_rounded),
                      hintStyle: TextStyle(color: pRegisTxtColor),
                      border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.065,
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
