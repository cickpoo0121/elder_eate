import 'package:elder_eate/constant.dart';
import 'package:elder_eate/screens/food/nutrition.dart';
import 'package:flutter/material.dart';

class FoodDetail extends StatefulWidget {
  const FoodDetail({Key? key}) : super(key: key);

  @override
  _FoodDetailState createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String foodMenu = "ข้าวต้มหมู";

    return Scaffold(
      backgroundColor: pHeaderTabColor,
      appBar: AppBar(
        backgroundColor: pHeaderTabColor,
        centerTitle: true,
        title: Text(
          'รายการอาหาร',
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
                  Container(
                    width: size.width * 0.45,
                    child: TextButton(
                      onPressed: () {},
                      child: Text("เพิ่มประวัติการกิน",
                          style: TextStyle(fontSize: 16)),
                    ),
                  )
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
