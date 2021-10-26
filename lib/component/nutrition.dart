import 'package:elder_eate/constant.dart';
import 'package:flutter/material.dart';

class Nutrition extends StatefulWidget {
  const Nutrition({
    Key? key,
    required this.calories,
    required this.sugar,
    required this.sodium,
  }) : super(key: key);

  final double calories;
  final double sugar;
  final double sodium;

  @override
  _NutritionState createState() => _NutritionState();
}

class _NutritionState extends State<Nutrition> {
  double _calories = 0;
  double _sugar = 0;
  double _sodium = 0;
  List<String> _foodCategory = [
    "assets/images/calories.png",
    "assets/images/sugar.png",
    "assets/images/sodium.png"
  ];
  List<String> _nutritionName = ["แคลอรี่", "น้ำตาล", "โซเดียม"];
  List<Color> _color = [pCaloriesColor, pSugarColor, pSodiumColor];

  @override
  void initState() {
    super.initState();
    _calories = widget.calories;
    _sugar = widget.sugar;
    _sodium = widget.sodium;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
