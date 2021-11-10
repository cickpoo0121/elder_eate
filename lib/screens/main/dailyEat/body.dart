import 'dart:developer';

import 'package:elder_eate/constant.dart';
import 'package:elder_eate/controller/balance_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DailyEateBody extends StatefulWidget {
  final data;
  const DailyEateBody({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  _DailyEateBodyState createState() => _DailyEateBodyState();
}

class _DailyEateBodyState extends State<DailyEateBody> {
  NutritionBalanceController _balanceController =
      Get.put(NutritionBalanceController());
  String? displayImage;
  int event = 1; // 1 คือ รายละเอียดอาหาร , 0 รายการอาหาร
  List<String> _foodCategory = [
    "assets/images/food.png",
    "assets/images/drink.png",
    "assets/images/dessert.png",
    "assets/images/fruit.png"
  ];

  var dailyEat = [];

  // Future dailyLoad() async {
  //   // setState(() async {
  //   dailyEat = await SqlService.instance.dailyLoad();
  //   // });
  //   print(dailyEat.length);
  // }

  // Future setFoodImage(dailyEat, index) async {
  //   // setState(() {
  //   displayImage = dailyEat[index]['Food_Category_ID'] == 0
  //       ? _foodCategory[0]
  //       : dailyEat[index]['Food_Category_ID'] == 1
  //           ? _foodCategory[1]
  //           : dailyEat[index]['Food_Category_ID'] == 2
  //               ? _foodCategory[2]
  //               : _foodCategory[3];
  //   // });
  //   return displayImage;
  // }

  @override
  void initState() {
    // dailyEat = widget.data;
    setState(() {
      dailyEat = widget.data;
    });
    super.initState();
    // inspect(dailyLoad());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return dailyEat.length == 0
        ? Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              'ไม่พบข้อมูล',
              style: TextStyle(fontSize: 16),
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: dailyEat.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      onTap: () => {},
                      leading: Image.asset(
                        dailyEat[index]['Food_Category_ID'] == 0
                            ? _foodCategory[0]
                            : dailyEat[index]['Food_Category_ID'] == 1
                                ? _foodCategory[1]
                                : dailyEat[index]['Food_Category_ID'] == 2
                                    ? _foodCategory[2]
                                    : _foodCategory[3],
                        height: size.height * 0.07,
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          // "text",
                          dailyEat[index]['Food_Name'],
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: pDetailTxtColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 18.sp),
                        ),
                      ),
                      trailing: Text(
                        // 'text',
                        dailyEat[index]['Daily_Food_Datetime']
                            .toString()
                            .substring(0, 10),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: pDetailTxtColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 18.sp),
                      ),
                    ),
                  ),
                ],
              );
            });
  }
}
