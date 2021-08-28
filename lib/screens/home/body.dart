import 'package:elder_eate/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';

class Home_body extends StatefulWidget {
  const Home_body({Key? key}) : super(key: key);

  @override
  _Home_bodyState createState() => _Home_bodyState();
}

class _Home_bodyState extends State<Home_body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: size.height * 0.3,
                  width: size.width * 1,
                  // color: Colors.red,
                ),
                Positioned(
                  child: SvgPicture.asset("assets/icons/cook.svg"),
                  top: -50,
                  right: 0,
                  left: 0,
                )
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  // width: size.width * 0.9,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: pDetailTxtColor),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 4, bottom: 4, right: 10, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_back_ios),
                        Spacer(),
                        Text(
                          "29/28/2564",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    leading: Image.asset("assets/images/calories.png"),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "แคลอรี",
                          style: TextStyle(
                              color: pDetailTxtColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Container(
                          width: size.width * 0.45,
                          child: GFProgressBar(
                            percentage: 0.375,
                            progressBarColor: pCaloriesColor,
                          ),
                        )
                      ],
                    ),
                    trailing: Text("750/2000"),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    leading: Image.asset("assets/images/sugar.png"),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "น้ำตาล",
                          style: TextStyle(
                              color: pDetailTxtColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Container(
                          width: size.width * 0.45,
                          child: GFProgressBar(
                            percentage: 0.1,
                            progressBarColor: pSugarColor,
                          ),
                        )
                      ],
                    ),
                    trailing: Text("50/500"),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    leading: Image.asset("assets/images/sodium.png"),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "โซเดียม",
                          style: TextStyle(
                              color: pDetailTxtColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Container(
                          width: size.width * 0.45,
                          child: GFProgressBar(
                            percentage: 0.233,
                            progressBarColor: pSodiumColor,
                          ),
                        )
                      ],
                    ),
                    trailing: Text("70/300"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
