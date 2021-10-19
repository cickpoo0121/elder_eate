import 'package:elder_eate/constant.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Nutrition extends StatefulWidget {
  const Nutrition({
    Key? key,
    required this.calories,
    required this.sugar,
    required this.sodium,
  }) : super(key: key);

  final int calories;
  final int sugar;
  final int sodium;

  @override
  _NutritionState createState() => _NutritionState();
}

class _NutritionState extends State<Nutrition> {
  int _calories = 0;
  int _sugar = 0;
  int _sodium = 0;
  List<String> _icon = [
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
                  leading: Image.asset(_icon[index]),
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
                          "${_calories} กิโลแคลอรี",
                          style: TextStyle(
                              color: pDetailTxtColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        )
                      : index == 1
                          ? Text(
                              "${_sugar} กรัม",
                              style: TextStyle(
                                  color: pDetailTxtColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15),
                            )
                          : Text(
                              "${_sodium} กรัม",
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
