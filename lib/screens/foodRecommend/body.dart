import 'package:elder_eate/component/nutritionPerDay.dart';
import 'package:elder_eate/constant.dart';
import 'package:flutter/material.dart';

class FoodRecommendBody extends StatefulWidget {
  const FoodRecommendBody({
    Key? key,
    // required this.calories,
    // required this.sugar,
    // required this.sodium,
  }) : super(key: key);

  // final int calories;
  // final int sugar;
  // final int sodium;

  @override
  _FoodRecommendBodyState createState() => _FoodRecommendBodyState();
}

class _FoodRecommendBodyState extends State<FoodRecommendBody> {
  // int _calories = 0;
  // int _sugar = 0;
  // int _sodium = 0;
  int event = 0; // 1 คือ รายละเอียดอาหาร , 0 รายการอาหาร
  List<String> _icon = [
    "assets/images/food.png",
    "assets/images/drink.png",
    "assets/images/dessert.png",
    "assets/images/fruit.png"
  ];
  List<Map<String, dynamic>> _nutritionData = [
    {"menu": "ข้าวต้มหมู", "datetime": DateTime.now()},
    {"menu": "ข้าวกะเพรา", "datetime": DateTime.now()},
    {"menu": "ข้าวพัด", "datetime": DateTime.now()},
    {"menu": "แกงจีด", "datetime": DateTime.now()},
  ];

  List<double> nutritionValue = [2000, 530, 320];
  List<double> maxNutrition = [2000, 500, 300];

  @override
  void initState() {
    super.initState();
    // _calories = widget.calories;
    // _sugar = widget.sugar;
    // _sodium = widget.sodium;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return noRecommend(size);
  }

  Widget haveRecommend(size) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _icon.length,
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
                onTap: () => Navigator.pushNamed(context, '/FoodDetail',
                    arguments: event),
                leading: Image.asset(
                  _icon[0],
                  height: size.height * 0.07,
                ),
                title: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    _nutritionData[index]['menu'],
                    // textAlign: TextAlign.left,
                    style: TextStyle(
                        color: pDetailTxtColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                // trailing: Padding(
                //   padding: const EdgeInsets.only(left: 20),
                //   child: Text(
                //     _nutritionData[index]['menu'],
                //     // textAlign: TextAlign.left,
                //     style: TextStyle(
                //         color: pDetailTxtColor,
                //         fontWeight: FontWeight.bold,
                //         fontSize: 18),
                //   ),
                // ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget noRecommend(size) {
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              // radius: size.width * 0.05,
              backgroundColor: Colors.red,
              foregroundColor: Colors.yellow,
              child: Icon(
                Icons.warning,
                // color: Colors.yellow,
                size: size.width * 0.06,
              ),
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            Text(
              'ไม่พบรายการอาหารแนะนำ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(
          height: size.height * 0.05,
        ),
        Text(
          'เนื่องจากปริมาณ แคลอรี่, น้ำตาล, และโซเดียมของคุณใกล้ครบปริมาณที่แนะนำต่อวัน',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        NutritionPerDay(
            nutritionValue: nutritionValue, maxNutrition: maxNutrition)
      ],
    );
  }
}
