import 'package:elder_eate/screens/home/nutritionPerDay.dart';
import 'package:elder_eate/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // backgroundColor: pBackgroundColor,
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: Text(
          'เพิ่มมื้ออาหารของคุณ',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                // print('object');
                Navigator.pushNamed(context, '/Profile');
              },
              child: Icon(
                Icons.account_circle,
                color: Colors.black,
                size: size.width * 0.08,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: pPadding,
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
                  NutritionPerDay(
                    nutritionValue: [750, 50, 70],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
