import 'package:elder_eate/constant.dart';
import 'package:flutter/material.dart';

class DailyEateBody extends StatefulWidget {
  const DailyEateBody({
    Key? key,
    // required this.calories,
    // required this.sugar,
    // required this.sodium,
  }) : super(key: key);

  // final int calories;
  // final int sugar;
  // final int sodium;

  @override
  _DailyEateBodyState createState() => _DailyEateBodyState();
}

class _DailyEateBodyState extends State<DailyEateBody> {
  // int _calories = 0;
  // int _sugar = 0;
  // int _sodium = 0;
  int event = 1; // 1 คือ รายละเอียดอาหาร , 0 รายการอาหาร 
  List<String> _icon = [
    "assets/images/food.png",
    "assets/images/drink.png",
    "assets/images/dessert.png",
    "assets/images/fruit.png"
  ];
  List<Map<String, dynamic>> _nutritionData = [
    {"menu": "ข้าวต้มหมู", "datetime": DateTime.now()},
    {"menu": "เค้ก", "datetime": DateTime.now()},
    {"menu": "น้ำอัดลม", "datetime": DateTime.now()},
    {"menu": "ข้าวโพด", "datetime": DateTime.now()},
  ];
  // List<Color> _color = [pCaloriesColor, pSugarColor, pSodiumColor];

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
                  onTap: () =>
                      Navigator.pushNamed(context, '/FoodDetail', arguments: event),
                  leading: Image.asset(
                    _icon[index],
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
                  trailing: Text(
                    _nutritionData[index]['datetime']
                        .toString()
                        .substring(0, 10),
                    // textAlign: TextAlign.left,
                    style: TextStyle(
                        color: pDetailTxtColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
