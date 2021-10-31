import 'package:elder_eate/component/nutritionPerDay.dart';
import 'package:elder_eate/constant.dart';
import 'package:elder_eate/controller/balance_controller.dart';
import 'package:elder_eate/screens/main/home/home.dart';
import 'package:elder_eate/service/sqlService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodRecommend extends StatefulWidget {
  final foodCatId;
  const FoodRecommend({
    Key? key,
    required this.foodCatId,
  }) : super(key: key);

  @override
  _FoodRecommendState createState() => _FoodRecommendState();
}

class _FoodRecommendState extends State<FoodRecommend> {
  NutritionBalanceController _balanceController = Get.find();
  var _balance, _nutritionDay;
  double? _cal, _sugar, _sodm;
  var _dailyEat;
  List<String> _foodCategory = [
    "assets/images/calories.png",
    "assets/images/sugar.png",
    "assets/images/sodium.png"
  ];

  Future foodRecommend() async {
    _cal = _balanceController.balance[0] - _balanceController.nutritionDay[0];
    _sugar = _balanceController.balance[1] - _balanceController.nutritionDay[1];
    _sodm = _balanceController.balance[2] - _balanceController.nutritionDay[2];

    _dailyEat = await SqlService.instance.foodRecommend(
      _cal,
      _sugar,
      _sodm,
    );

    // setState(() {
    //   _dailyEat = _dailyEat;
    // });
    print(_dailyEat);
    return _dailyEat;
  }

  @override
  void initState() {
    _balance = _balanceController.balance;
    _nutritionDay = _balanceController.nutritionDay;
    foodRecommend();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: pHeaderTabColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: pHeaderTabColor,
        centerTitle: true,
        title: Text(
          'อาหารแนะนำ',
          style: TextStyle(fontWeight: FontWeight.w700),

          // style: Theme.of(context).textTheme.headline1,
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
                    FutureBuilder(
                        future: foodRecommend(),
                        builder: (context, snapshot) => snapshot.hasData
                            ? haveRecommend(size, snapshot.data)
                            : noRecommend(size)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: size.width * 0.45,
        child: TextButton(
          onPressed: () {
            Get.offAll(Home(currentPage: 0));
          },
          child: Text(
            'กลับหน้าหลัก',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget haveRecommend(size, foodMenu) {
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
                onTap: () => Get.toNamed('/FoodDetail', arguments: 0),
                // Navigator.pushNamed(context, '/FoodDetail', arguments: 0),
                leading: Image.asset(
                  _foodCategory[0],
                  height: size.height * 0.07,
                ),
                title: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    // 'test',
                    _dailyEat[index]['Food_Name'],
                    // _nutritionData[index]['menu'],
                    // textAlign: TextAlign.left,
                    style: TextStyle(
                        color: pDetailTxtColor,
                        fontWeight: FontWeight.w700,
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
                //         fontWeight: FontWeight.w700,
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            )
          ],
        ),
        SizedBox(
          height: size.height * 0.05,
        ),
        Text(
          'เนื่องจากปริมาณ แคลอรี่, น้ำตาล, หรือโซเดียม ของคุณใกล้ครบหรือเกินปริมาณที่แนะนำต่อวัน',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        NutritionPerDay(nutritionValue: [
          _balanceController.nutritionDay[0],
          _balanceController.nutritionDay[1],
          _balanceController.nutritionDay[2],
        ], maxNutrition: [
          _balanceController.balance[0],
          _balanceController.balance[1],
          _balanceController.balance[2],
        ])
      ],
    );
  }
}
