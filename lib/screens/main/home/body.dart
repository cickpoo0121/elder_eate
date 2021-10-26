import 'dart:convert';

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
  List<double>? nutritionPerday = [123, 12, 500];
  List<double>? maxNutrition = [];

  SharedPreferences? _pref;
  String _titleName = 'เพิ่มมื้ออาหารของคุณ';
  String _status = '';
  Widget? _mainIcon;
  Map? _balance;

  Future maxNutritionload() async {
    _pref = await SharedPreferences.getInstance();
    final data = _pref!.getString('balance');
    setState(() {
      _balance = jsonDecode(data!);
      maxNutrition!.add(_balance!['calroies']);
      maxNutrition!.add(_balance!['sugar']);
      maxNutrition!.add(_balance!['sodium']);
      print('_balance ================ $_balance');
    });
  }

  Future dailyLoad() async {
    final dailyEat = await SqlService.instance.dailyLoad();
    print(dailyEat);
    return dailyEat;
  }

  resultOfday() async {
    for (int i = 0; i < nutritionPerday!.length; i++) {
      if (nutritionPerday![i] == 0) {
        _titleName = "เพิ่มมื้ออาหารของคุณ";
        _status = 'add';

        // _mainIcon = Positioned(
        //   child: Container(
        //       width: Adaptive.w(20),
        //       height: 35.5.h,
        //       child: SvgPicture.asset("assets/icons/cook.svg")),
        //   top: -50,
        //   right: 0,
        //   left: 0,
        // );
      } else if (nutritionPerday![i] >= maxNutrition![i]) {
        _titleName = "อาหารเกินเกณฑ์";
        _status = 'over';

        // _mainIcon = Positioned(
        //   child: Container(
        //     width: Adaptive.w(20),
        //     height: 35.5.h,
        //     child: SvgPicture.asset(
        //       "assets/icons/overCase.svg",
        //       height: 200,
        //     ),
        //   ),
        //   // top: -2,
        //   right: 0,
        //   left: 0,
        // );
      } else {
        _titleName = "สารอาหารอยู่ตามเกณฑ์";
        _status = 'incase';
        // _mainIcon = Positioned(
        //   child: Container(
        //       width: Adaptive.w(20), // This will take 20% of the screen's width
        //       height: 35.5.h,
        //       child: SvgPicture.asset("assets/icons/inCase.svg")),
        //   // top: -10,
        //   right: 0,
        //   left: 0,
        // );
      }
      setState(() {
        _mainIcon = Positioned(
          child: Container(
              width: Adaptive.w(20),
              height: 35.5.h,
              child: SvgPicture.asset(_status == 'add'
                  ? "assets/icons/cook.svg"
                  : _status == 'over'
                      ? 'assets/icons/overCase.svg'
                      : 'assets/icons/inCase.svg')),
          top: _status == 'add' ? -50 : 0,
          right: 0,
          left: 0,
        );
      });
    }
  }

  Future refreshNotes() async {
    // setState(() => isLoading = true);
    var result;
    // result = await ElderEatDatabase.instance.loadUser();

    // print(result);

    // setState(() => isLoading = false);
  }

  @override
  void initState() {
    maxNutritionload();
    resultOfday();
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
      body: SingleChildScrollView(
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
                  _mainIcon != null ? _mainIcon! : Container(),
                  _status == 'over'
                      ? Positioned(
                          child: Center(
                              child: Text(
                            "โปรดออกกำลังกายเพิ่มเติม",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18),
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
                      border: Border.all(width: 2.0, color: pDetailTxtColor),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 4, bottom: 4, right: 10, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_back_ios),
                          Spacer(),
                          Text(
                            "29/28/2564",
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.w700),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ),
                  _balance == null
                      ? CircularProgressIndicator()
                      : NutritionPerDay(
                          nutritionValue: nutritionPerday!,
                          maxNutrition: maxNutrition!
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
