import 'package:elder_eate/constant.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NutritionPerDay extends StatefulWidget {
  const NutritionPerDay({
    Key? key,
    required this.nutritionValue,
    required this.maxNutrition,
  }) : super(key: key);

  final List<double> nutritionValue;
  final List<double> maxNutrition;

  @override
  _NutritionPerDayState createState() => _NutritionPerDayState();
}

class _NutritionPerDayState extends State<NutritionPerDay> {
  List<double> _nutritionValue = [];
  List<double> _maxNutrition = [];
  List<String> _foodCategory = [
    "assets/images/calories.png",
    "assets/images/sugar.png",
    "assets/images/sodium.png"
  ];
  List<String> _nutritionName = ["แคลอรี", "น้ำตาล", "โซเดียม"];
  List<Color> _color = [pCaloriesColor, pSugarColor, pSodiumColor];

  double calNutrition(index) {
    // print(_nutritionValue[index] / _maxNutrition[index]);
    double result = _nutritionValue[index] / _maxNutrition[index];
    if (result >= 1) {
      _color[index] = Colors.red;
      return 1;
    }
    return _nutritionValue[index] / _maxNutrition[index];
    // return 0.2;
  }

  @override
  void initState() {
    _nutritionValue = widget.nutritionValue;
    _maxNutrition = widget.maxNutrition;
    print('perdayyyyyyyyyyyy');
    // print(widget.maxNutrition.toString());
    // print(widget.nutritionValue.toString());
    super.initState();
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
                    leading: Image.asset(
                      _foodCategory[index],
                      width: size.width * 0.1,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _nutritionName[index],
                          style: TextStyle(
                              color: pDetailTxtColor,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          // height: 20,
                          height: size.height * 0.002,
                        ),
                        Container(
                          width: size.width * 0.4,
                          child: GFProgressBar(
                            lineHeight: 10,
                            percentage: calNutrition(index),
                            progressBarColor: _color[index],
                          ),
                        )
                      ],
                    ),
                    trailing:
                        // index == 0
                        //     ?
                        Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "${_nutritionValue[index].toStringAsFixed(0)}/${_maxNutrition[index].toStringAsFixed(0)}",
                          style: TextStyle(
                              color: pDetailTxtColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                        Text(
                          index == 0 ? 'กิโลแคลอรี' : 'กรัม',
                          style: TextStyle(
                              color: pDetailTxtColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                      ],
                    )),
              ),
            ],
          );
        });
  }
}
