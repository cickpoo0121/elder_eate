import 'package:elder_eate/constant.dart';
import 'package:elder_eate/controller/foodMenu_controller.dart';
import 'package:elder_eate/screens/food/foodDetail.dart';
import 'package:elder_eate/service/sqlService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DailyEat extends StatefulWidget {
  const DailyEat({Key? key}) : super(key: key);

  @override
  _DailyEatState createState() => _DailyEatState();
}

class _DailyEatState extends State<DailyEat> {
  FoodMenuController _foodMenuController = Get.put(FoodMenuController());

  var dailyEat;
  List<String> foodCategory = [
    "assets/images/food.png",
    "assets/images/drink.png",
    "assets/images/dessert.png",
    "assets/images/fruit.png"
  ];
  Future dailyLoad() async {
    dailyEat = await SqlService.instance.allDailyLoad();
    print(dailyEat);
    return dailyEat;
  }

  @override
  void initState() {
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
          'ประวัติการกิน',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        elevation: 0.0,
      ),
      body: Padding(
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
                  FutureBuilder(
                      future: dailyLoad(),
                      builder: (context, snapshot) => snapshot.hasData
                          ? Expanded(
                              child: showDailyEate(snapshot.data, foodCategory,
                                  size, _foodMenuController))
                          : Center(
                              child: CircularProgressIndicator(),
                            ))
                ],
              ),
            ),
          ),
        ),
      ),
      // Positioned(child: child)
    );
  }
}

Widget showDailyEate(dailyEat, foodCategory, size, _foodMenuController) {
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
                GestureDetector(
                  onTap: () {
                    _foodMenuController.foodManu.value = dailyEat[index];
                    Get.to(() => FoodDetail(
                          eventCheck: 1,
                          foodImage: 'yes',
                        ));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      leading: Image.asset(
                        dailyEat[index]['Food_Category_ID'] == 0
                            ? foodCategory[0]
                            : dailyEat[index]['Food_Category_ID'] == 1
                                ? foodCategory[1]
                                : dailyEat[index]['Food_Category_ID'] == 2
                                    ? foodCategory[2]
                                    : foodCategory[3],
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
                ),
              ],
            );
          });
}
