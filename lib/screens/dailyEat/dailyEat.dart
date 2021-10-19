import 'package:elder_eate/constant.dart';
import 'package:elder_eate/screens/dailyEat/body.dart';
import 'package:elder_eate/component/nutrition.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DailyEat extends StatefulWidget {
  const DailyEat({Key? key}) : super(key: key);

  @override
  _DailyEatState createState() => _DailyEatState();
}

class _DailyEatState extends State<DailyEat> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: pHeaderTabColor,
      appBar: AppBar(
        backgroundColor: pHeaderTabColor,
        centerTitle: true,
        title: Text(
          'ประวัติการกิน',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: ConstrainedBox(
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
              child: Padding(
                padding: pPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    DailyEateBody(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      // Positioned(child: child)
    );
  }
}
