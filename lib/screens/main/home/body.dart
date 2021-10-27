import 'dart:convert';
import 'dart:developer';

import 'package:elder_eate/component/nutritionPerDay.dart';
import 'package:elder_eate/constant.dart';
import 'package:elder_eate/controller/balance_controller.dart';
import 'package:elder_eate/service/sqlService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  NutritionBalanceController _balanceController =
      Get.put(NutritionBalanceController());
  List<double>? _nutritionPerday = [];
  List<double>? _maxNutrition = [];

  SharedPreferences? _pref;
  String _titleName = 'เพิ่มมื้ออาหารของคุณ';
  String _status = '';
  // Widget? _mainIcon;
  String? _pic;
  DateTime _nowDate = DateTime.now();

  Future valuePerdayload(nowDate) async {
    _pref = await SharedPreferences.getInstance();
    final dataBalance = _pref!.getString('balance');
    double cal = 0, sugar = 0, sodm = 0;
    Map? _balance;

    final dataNutritionDay = await SqlService.instance
        .dailyDayLoad('${nowDate.year}-${nowDate.month}-${nowDate.day}');

    // if (dataNutritionDay.length == 0) {
    //   dataNutritionDay = [];
    // }

    for (int i = 0; i < dataNutritionDay.length; i++) {
      cal = cal + dataNutritionDay[i]['Food_Calories'];
      sugar = sugar + dataNutritionDay[i]['Food_Sugar'];
      sodm = sodm + dataNutritionDay[i]['Food_Sodium'];
      print('hi');
    }
    setState(() {
      _nutritionPerday = [];
      _nutritionPerday!.add(cal);
      _nutritionPerday!.add(sugar);
      _nutritionPerday!.add(sodm);

      _balance = jsonDecode(dataBalance!);
      _maxNutrition = [];
      _maxNutrition!.add(_balance!['calroies']);
      _maxNutrition!.add(_balance!['sugar']);
      _maxNutrition!.add(_balance!['sodium']);

      // print('_balance ================ $_balance');

      resultOfday();
    });
    print(_nutritionPerday.toString());
    print(_maxNutrition.toString());
  }

  resultOfday() async {
    for (int i = 0; i < _nutritionPerday!.length; i++) {
      if (_nutritionPerday![i] == 0) {
        _titleName = "เพิ่มมื้ออาหารของคุณ";
        _status = 'add';
        _pic = 'assets/icons/cook.svg';
      } else if (_nutritionPerday![i] >= _maxNutrition![i]) {
        _titleName = "อาหารเกินเกณฑ์";
        _status = 'over';
        _pic = 'assets/icons/overCase.svg';
      } else {
        _titleName = "สารอาหารอยู่ตามเกณฑ์";
        _status = 'incase';
        _pic = 'assets/icons/inCase.svg';
        ;
      }
      setState(() {
        _pic = _pic;
      });
    }
  }

  changeDate(int action) {
    // action -1 is decrease date and 1 increase date
    if (action < 0) {
      setState(() {
        _nowDate = DateTime(_nowDate.year, _nowDate.month, _nowDate.day - 1);
      });
      return;
    }
    if (action > 0) {
      setState(() {
        _nowDate = DateTime(_nowDate.year, _nowDate.month, _nowDate.day + 1);
      });
      return;
    }
  }

  @override
  void initState() {
    valuePerdayload(_nowDate);
    // resultOfday();
    super.initState();
  }

  @override
  void dispose() {
    // ElderEatDatabase.instance.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // backgroundColor: pBackgroundColor,
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: Text(
          _titleName,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 22.sp),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                // print('object');
                // _sqlHelper.testdb();

                Navigator.pushNamed(context, '/Profile');
              },
              child: Icon(
                Icons.account_circle,
                color: Colors.black,
                size: size.width * 0.08,
              ),
            ),
          ),
        ],
      ),
      body: _maxNutrition!.length == 0 ||
              _nutritionPerday!.length == 0 ||
              _status == ''
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: pPadding,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: size.height * 0.3,
                          width: size.width * 1,
                          // color: Colors.red,
                        ),
                        _status != ''
                            ? Positioned(
                                child: Container(
                                  width: Adaptive.w(20),
                                  height: 35.5.h,
                                  child: SvgPicture.asset(_pic!),
                                ),
                                top: _status == 'add' ? -50 : 0,
                                right: 0,
                                left: 0,
                              )
                            : Container(),
                        _status == 'over'
                            ? Positioned(
                                child: Center(
                                    child: Text(
                                  "โปรดออกกำลังกายเพิ่มเติม",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                )),
                                // top: -5,
                                // right: 0.5,
                                // left: 0,
                              )
                            : Container(),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Container(
                          // width: size.width * 0.9,
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 2.0, color: pDetailTxtColor),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 4, bottom: 4, right: 10, left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    changeDate(-1);
                                    valuePerdayload(_nowDate);
                                  },
                                  child: Icon(Icons.arrow_back_ios),
                                ),
                                Spacer(),
                                Text(
                                  '${_nowDate.day}/${_nowDate.month}/${_nowDate.year + 543}',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                                Spacer(),
                                GestureDetector(
                                    onTap: () {
                                      changeDate(1);
                                      valuePerdayload(_nowDate);
                                    },
                                    child: Icon(Icons.arrow_forward_ios)),
                              ],
                            ),
                          ),
                        ),
                        NutritionPerDay(
                          nutritionValue: _nutritionPerday!,
                          maxNutrition: _maxNutrition!
                          // [
                          //   _balance!['calroies'],
                          //   _balance!['sugar'],
                          //   _balance!['sodium'],
                          // ]
                          ,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
