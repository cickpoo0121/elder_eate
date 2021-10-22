import 'package:elder_eate/constant.dart';
import 'package:elder_eate/component/nutrition.dart';
import 'package:elder_eate/controller/foodMenu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodDetail extends StatefulWidget {
  final eventCheck;
  // final foodMenu;
  final foodImage;
  const FoodDetail(
      {Key? key,
      required this.eventCheck,
      // required this.foodMenu,
      this.foodImage = 'no'})
      : super(key: key);

  @override
  _FoodDetailState createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  FoodMenuController _foodMenuController = Get.find();
  // int? _event; // 1 คือ รายละเอียดอาหาร , 0 รายการอาหาร
  Map? foodMenu;
  String? displayImage;

  // food category :{ 0 = อาหารจารหลัก, 1 = เครื่องดื่ม, 2 = ของหวาน, 3 = ผลไม้ }
  List<String> _foodCategory = [
    "assets/images/food.png",
    "assets/images/drink.png",
    "assets/images/dessert.png",
    "assets/images/fruit.png"
  ];

  Future addImagetoMap(Map foodMenu, String displayImage) async {
    Map<String, dynamic> newfoodMenu = Map<String, dynamic>.from(foodMenu);
    newfoodMenu['Daily_Food_Image'] = displayImage;

    _foodMenuController.foodManu.value = newfoodMenu;
  }

  Future setFoodImage() async {
    setState(() {
      displayImage = widget.foodImage == 'no' || widget.foodImage == null
          ? foodMenu!['Food_Category_ID'] == 0
              ? _foodCategory[0]
              : foodMenu!['Food_Category_ID'] == 1
                  ? _foodCategory[1]
                  : foodMenu!['Food_Category_ID'] == 2
                      ? _foodCategory[2]
                      : _foodCategory[3]
          : _foodMenuController.foodManu['Daily_Food_Image'];
    });
  }

  @override
  void initState() {
    foodMenu = _foodMenuController.foodManu;
    setFoodImage();
    super.initState();
    print(foodMenu!['Daily_Food_Image']);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: pHeaderTabColor,
      appBar: AppBar(
        backgroundColor: pHeaderTabColor,
        centerTitle: true,
        title: Text(
          widget.eventCheck == 0 ? 'รายการอาหาร' : 'รายละเอียดอาหาร',
          style: TextStyle(fontWeight: FontWeight.w700),
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
                    displayImage!,
                    height: size.height * 0.25,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    foodMenu!['Food_Name'],
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
                  ),
                  Padding(
                    padding: pPadding,
                    child: Nutrition(
                        calories: foodMenu!['Food_Calories'].toDouble(),
                        sugar: foodMenu!['Food_Sugar'].toDouble(),
                        sodium: foodMenu!['Food_Sodium'].toDouble()),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  widget.eventCheck == 0
                      ? Container(
                          width: size.width * 0.45,
                          child: TextButton(
                            onPressed: () {
                              // Navigator.pushNamed(context, '/AddMeal');
                              // foodMenu!.putIfAbsent(
                              //     'Daily_Food_Image', () => displayImage);
                              // foodMenu!['Daily_Food_Image'] = displayImage;
                              addImagetoMap(foodMenu!, displayImage!);
                              Get.toNamed('/AddMeal');
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
