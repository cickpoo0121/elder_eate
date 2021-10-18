import 'package:elder_eate/constant.dart';
import 'package:elder_eate/component/nutrition.dart';
import 'package:elder_eate/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddMeal extends StatefulWidget {
  const AddMeal({Key? key}) : super(key: key);

  @override
  _AddMealState createState() => _AddMealState();
}

class _AddMealState extends State<AddMeal> {
  String foodMenu = "ข้าวต้มหมู";
  // List<double> nutritionBalance = [800, 500, 70]; //case calories over
  // List<double> nutritionBalance = [1000, 400, 70]; //case sugar over
  List<double> nutritionBalance = [1000, 500, 30]; //case sodium over
  List<double> foodNutrition = [1000, 500, 70];
  late String overNutri;

  checkDayNutri() {
    overNutri = '';
    for (int i = 0; i < nutritionBalance.length; i++) {
      if (nutritionBalance[i] < foodNutrition[i]) {
        overNutri += i == 0
            ? 'แคลอรี'
            : i == 1
                ? 'น้ำตาล'
                : 'โซเดียม';
      }
    }
  }

// jump to daily eate page
  goDailyEat() {
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      builder: (BuildContext context) {
        return Home(
          currentPage: 2,
        );
      },
    ), (route) => false);

    // .push(
    //   MaterialPageRoute(
    //     builder: (BuildContext context) {
    //       return Home(
    //         currentPage: 2,
    //       );
    //     },
    //   ),
    // );
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
            content: Text(
              'ปริมาณ${overNutri}ในอาหารเกินกว่ากำหนดของวันนี้ ท่านต้องการยืนยันทานอาหารชนิดนี้หรือดูรายการอาหารเพิ่มเติม',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
                  Navigator.pushReplacementNamed(context, '/FoodRecommend');
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
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: pHeaderTabColor,
      appBar: AppBar(
        backgroundColor: pHeaderTabColor,
        centerTitle: true,
        title: Text(
          'เพิ่มมื้ออาหาร',
          style: TextStyle(fontWeight: FontWeight.bold),
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
                      foodMenu,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "เช้า",
                              style: TextStyle(
                                  color: sButtonTxtColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: sButtonColor,
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text("กลางวัน",
                                  style: TextStyle(
                                      color: pButtonTxtColor,
                                      fontWeight: FontWeight.bold)),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: pButtonColor,
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text("เย็น",
                                style: TextStyle(
                                    color: sButtonTxtColor,
                                    fontWeight: FontWeight.bold)),
                            style: TextButton.styleFrom(
                              backgroundColor: sButtonColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.remove,
                              color: sButtonTxtColor,
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: sButtonColor,
                              shape: CircleBorder(),
                            ),
                          ),
                          Spacer(),
                          Container(
                            alignment: Alignment.center,
                            width: size.width * 0.49,
                            height: size.height * 0.05,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              "x1",
                              style: TextStyle(
                                color: pDetailTxtColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Spacer(),
                          ElevatedButton(
                            onPressed: () {},
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
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Nutrition(calories: 500, sugar: 20, sodium: 70),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Container(
                      width: size.width * 0.45,
                      child: TextButton(
                        onPressed: () {
                          // Navigator.pushNamed(context, '/Home');

                          checkDayNutri();
                          overNutri != null ? alert() : goDailyEat();
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
}
