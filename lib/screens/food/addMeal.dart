import 'dart:developer';

import 'package:elder_eate/constant.dart';
import 'package:elder_eate/controller/balance_controller.dart';
import 'package:elder_eate/controller/foodMenu_controller.dart';
import 'package:elder_eate/screens/foodRecommend/foodRecommend.dart';
import 'package:elder_eate/screens/main/home/home.dart';
import 'package:elder_eate/service/sqlService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMeal extends StatefulWidget {
  const AddMeal({Key? key}) : super(key: key);

  @override
  _AddMealState createState() => _AddMealState();
}

class _AddMealState extends State<AddMeal> {
  FoodMenuController _foodMenuController = Get.find();
  NutritionBalanceController _balanceController = Get.find();
  Map? foodMenu;
  int meal = 0;
  int quantity = 1;
  String overNutri = '';
  List<String> _nutritionName = ["แคลอรี่", "น้ำตาล", "โซเดียม"];
  List<Color> _color = [pCaloriesColor, pSugarColor, pSodiumColor];
  List<String> _foodCategory = [
    "assets/images/calories.png",
    "assets/images/sugar.png",
    "assets/images/sodium.png"
  ];

  checkDayNutri() {
    final balance = _balanceController.balance;
    final nutritionDay = _balanceController.nutritionDay;
    final foodNutrition = [
      foodMenu!['Food_Calories'],
      foodMenu!['Food_Sugar'],
      foodMenu!['Food_Sodium'],
    ];

    overNutri = '';
    for (int i = 0; i < balance.length; i++) {
      if ((balance[i] - nutritionDay[i]) < foodNutrition[i] * quantity) {
        if (i == 0) {
          overNutri = overNutri + ' แคลอรี ';
          continue;
        } else if (i == 1) {
          overNutri = overNutri + ' น้ำตาล ';
          continue;
        } else {
          overNutri = overNutri + ' โซเดียม ';
          continue;
        }
      }
    }
  }

// jump to daily eate page
  goDailyEat() {
    SqlService.instance.dailyAdd({
      "Daily_Food_Image": foodMenu!['Daily_Food_Image'],
      "Daily_Food_Datetime": DateTime.now().toString(),
      "Daily_Meal": meal,
      "Food_Menu": foodMenu!['Food_Menu_ID'],
      "Quantity": quantity,
      "User_ID": 0,
    });

    SqlService.instance.allDailyLoad();
    Get.offAll(() => Home(currentPage: 2));
  }

  alert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                'ปริมาณอาหารเกิน',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
              ),
            ),
            content: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'ปริมาณ',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: '$overNutri',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w700),
                  ),
                  TextSpan(
                    text:
                        'ในอาหารเกินกว่ากำหนดของวันนี้ ท่านต้องการยืนยันทานอาหารชนิดนี้หรือดูรายการอาหารเพิ่มเติม',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  goDailyEat();
                },
                child: Text(
                  'ยืนยัน',
                ),
                style: TextButton.styleFrom(
                  backgroundColor: sButtonColor,
                  primary: Colors.red,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.off(() => FoodRecommend(
                        foodCatId: foodMenu!['Food_Category_ID'],
                      ));
                  // Get.offAndToNamed('/FoodRecommend',
                  //     arguments: foodMenu!['Food_Category_ID']);
                },
                child: Text(
                  'อาหารทดแทน',
                  // style: TextStyle(color: Colors.red),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: sButtonColor,
                  primary: Color(0xFF0047FF),
                ),
              )
            ],
          );
        });
  }

  @override
  void initState() {
    foodMenu = _foodMenuController.foodManu;
    inspect('bbbb${_balanceController.balance}');
    inspect('nnnnn${_balanceController.nutritionDay}');
    print('new food $foodMenu');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: pHeaderTabColor,
      appBar: AppBar(
        backgroundColor: pHeaderTabColor,
        centerTitle: true,
        title: Text(
          'เพิ่มมื้ออาหาร',
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
                    Text(
                      foodMenu!['Food_Name'],
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                meal = 0;
                              });
                            },
                            child: Text(
                              "เช้า",
                              style: TextStyle(
                                  color: meal == 0
                                      ? pButtonTxtColor
                                      : sButtonTxtColor,
                                  fontWeight: FontWeight.w700),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  meal == 0 ? pButtonColor : sButtonColor,
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                meal = 1;
                              });
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "กลางวัน",
                                style: TextStyle(
                                    color: meal == 1
                                        ? pButtonTxtColor
                                        : sButtonTxtColor,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  meal == 1 ? pButtonColor : sButtonColor,
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                meal = 2;
                              });
                            },
                            child: Text(
                              "เย็น",
                              style: TextStyle(
                                  color: meal == 2
                                      ? pButtonTxtColor
                                      : sButtonTxtColor,
                                  fontWeight: FontWeight.w700),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  meal == 2 ? pButtonColor : sButtonColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              quantity == 1 ? quantity = 1 : quantity--;
                            });
                          },
                          child: Icon(
                            Icons.remove,
                            color: sButtonTxtColor,
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: sButtonColor,
                            shape: CircleBorder(),
                          ),
                        ),
                        // Spacer(),
                        Container(
                          alignment: Alignment.center,
                          width: size.width * 0.49,
                          height: size.height * 0.05,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "x$quantity",
                            style: TextStyle(
                              color: pDetailTxtColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        // Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          child: Icon(
                            Icons.add,
                            color: sButtonTxtColor,
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: sButtonColor,
                            shape: CircleBorder(),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    nutrition(
                      size,
                      foodMenu!['Food_Calories'].toDouble() * quantity,
                      foodMenu!['Food_Sugar'].toDouble() * quantity,
                      foodMenu!['Food_Sodium'].toDouble() * quantity,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Container(
                      width: size.width * 0.45,
                      child: TextButton(
                        onPressed: () {
                          checkDayNutri();
                          overNutri != '' ? alert() : goDailyEat();
                        },
                        child: Text("เพิ่มประวัติการกิน",
                            style: TextStyle(fontSize: 16)),
                      ),
                    )
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

  Widget nutrition(size, _calories, _sugar, _sodium) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: _foodCategory.length,
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
                  leading: Image.asset(_foodCategory[index]),
                  title: Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Text(
                      _nutritionName[index],

                      // textAlign: TextAlign.left,
                      style: TextStyle(
                          color: pDetailTxtColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 15),
                    ),
                  ),
                  trailing: index == 0
                      ? Text(
                          "${_calories.toStringAsFixed(0)} กิโลแคลอรี",
                          style: TextStyle(
                              color: pDetailTxtColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        )
                      : index == 1
                          ? Text(
                              "${_sugar.toStringAsFixed(0)}กรัม",
                              style: TextStyle(
                                  color: pDetailTxtColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15),
                            )
                          : Text(
                              "${_sodium.toStringAsFixed(0)} กรัม",
                              style: TextStyle(
                                  color: pDetailTxtColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15),
                            ),
                ),
              ),
            ],
          );
        });
  }
}
