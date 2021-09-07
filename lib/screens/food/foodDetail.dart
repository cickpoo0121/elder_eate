import 'package:elder_eate/constant.dart';
import 'package:elder_eate/component/nutrition.dart';
import 'package:flutter/material.dart';

class FoodDetail extends StatefulWidget {
  const FoodDetail({
    Key? key,
  }) : super(key: key);

  @override
  _FoodDetailState createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  int _event = 0; // 1 คือ รายละเอียดอาหาร , 0 รายการอาหาร
  String foodMenu = "ข้าวต้มหมู";
  

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _event = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      backgroundColor: pHeaderTabColor,
      appBar: AppBar(
        backgroundColor: pHeaderTabColor,
        centerTitle: true,
        title: Text(
          _event == 0 ? 'รายการอาหาร' : 'รายละเอียดอาหาร',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0.0,
        // shape: RoundedRectangleBorder(
        //   borderRadius:
        //       BorderRadius.vertical(bottom: Radius.elliptical(size.width, 56)),
        // ),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Image.asset(
                    "assets/images/foodOne.jpg",
                    height: size.height * 0.25,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    foodMenu,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Padding(
                    padding: pPadding,
                    child: Nutrition(calories: 500, sugar: 20, sodium: 70),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  _event == 0
                      ? Container(
                          width: size.width * 0.45,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/AddMeal');
                            },
                            child: Text("เพิ่มประวัติการกิน",
                                style: TextStyle(fontSize: 16)),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
      // Positioned(child: child)
    );
  }
}
