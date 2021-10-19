import 'package:elder_eate/component/nutrition.dart';
import 'package:elder_eate/constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
        appBar: AppBar(
            backgroundColor: pBackgroundColor,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            elevation: 0.0),
        body: Center(
          child: Padding(
            padding: pPadding,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.03,
                ),
                Container(
                  // child: AutoSizeText(
                  //   'Hello Geeks!. We will break this line into 3 lines !!',
                  //   style: TextStyle(fontSize: 30.0),
                  //   maxLines: 3,
                  // ),
                  child: FittedBox(
                    child:Text(
                    _text,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.w700),
                  ), 
                  )
                  
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Nutrition(calories: 2000, sugar: 500, sodium: 300),
                SizedBox(
                  height: size.height * 0.07,
                ),
                Container(
                  width: size.width * 0.39,
                  decoration: BoxDecoration(),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/Home', (route) => false);
                    },
                    child: FittedBox(
                      child:  Text(
                      "เริ่มต้นใช้งาน",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    )
                   
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
