import 'package:elder_eate/constant.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';

class NutritionPerDay extends StatefulWidget {
  const NutritionPerDay({
    Key? key,
    required this.nutritionValue,
  }) : super(key: key);

  final List<int> nutritionValue;

  @override
  _NutritionPerDayState createState() => _NutritionPerDayState();
}

class _NutritionPerDayState extends State<NutritionPerDay> {
  List<int> _nutritionValue = [];
  List<String> _icon = [
    "assets/images/calories.png",
    "assets/images/sugar.png",
    "assets/images/sodium.png"
  ];
  List<String> _nutritionName = ["แคลอรี", "น้ำตาล", "โซเดียม"];
  List<Color> _color = [pCaloriesColor, pSugarColor, pSodiumColor];
  List<int> _maxNutrition = [2000, 500, 300];
  double calNutrition(index) {
    // print(_nutritionValue[index] / _maxNutrition[index]);
    return _nutritionValue[index] / _maxNutrition[index];
    // return 0.2;
  }

  @override
  void initState() {
    super.initState();
    _nutritionValue = widget.nutritionValue;
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
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _nutritionName[index],
                        style: TextStyle(
                            color: pDetailTxtColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        // height: 20,
                        height: size.height * 0.002,
                      ),
                      Container(
                        width: size.width * 0.45,
                        child: GFProgressBar(
                          lineHeight: 10,
                          percentage: calNutrition(index),
                          progressBarColor: _color[index],
                        ),
                      )
                    ],
                  ),
                  trailing:
                      Text("${_nutritionValue[index]}/${_maxNutrition[index]}"),
                ),
              ),
            ],
          );
        });
  }
}
