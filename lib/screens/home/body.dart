import 'package:elder_eate/component/nutritionPerDay.dart';
import 'package:elder_eate/constant.dart';
import 'package:elder_eate/service/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  // double calories = 2500;
  // double sugar = 1000;
  // double sodium = 302;

  // List<double> nutritionValue = [750, 70, 30];
  // List<double> nutritionValue = [0, 0, 0];
  List<double> nutritionValue = testnutritionValue;
  List<double> maxNutrition = testmaxNutrition;

  String titleName = 'เพิ่มมื้ออาหารของคุณ';
  String mainIconName = 'assets/icons/cook.svg';
  String status = '';
  late Widget mainIcon;

  resultOfday() {
    for (int i = 0; i < nutritionValue.length; i++) {
      if (nutritionValue[i] == 0) {
        titleName = "เพิ่มมื้ออาหารของคุณ";
        status = 'add';

        mainIcon = Positioned(
          child: Container(
            width: Adaptive.w(20),   
            height: 35.5.h,
              child: SvgPicture.asset("assets/icons/cook.svg")),
          top: -50,
          right: 0,
          left: 0,
        );
      } else if (nutritionValue[i] >= maxNutrition[i]) {
        titleName = "อาหารเกินเกณฑ์";
        status = 'over';

        mainIcon = Positioned(
          child: Container(
              width: Adaptive.w(20),   
            height: 35.5.h,
            child: SvgPicture.asset(
              "assets/icons/overCase.svg",
              height: 200,
            ),
          ),
          // top: -2,
          right: 0,
          left: 0,
        );
      } else {
        titleName = "สารอาหารอยู่ตามเกณฑ์";
        status = 'incase';
        mainIcon = Positioned(
          child: Container(
              width: Adaptive.w(20),    // This will take 20% of the screen's width
            height: 35.5.h,
            child: SvgPicture.asset("assets/icons/inCase.svg")),
          // top: -10,
          right: 0,
          left: 0,
        );
      }
    }
  }

  Future refreshNotes() async {
    // setState(() => isLoading = true);
    var result;
    result = await ElderEatDatabase.instance.loadUser();

    print(result);

    // setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    resultOfday();
    refreshNotes();
  }

  @override
  void dispose() {
    ElderEatDatabase.instance.close();
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
          titleName,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 22.sp),
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
                  mainIcon,
                  status == 'over'
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
                  NutritionPerDay(
                    nutritionValue: nutritionValue,
                    maxNutrition: maxNutrition,
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
