import 'package:elder_eate/constant.dart';
import 'package:elder_eate/controller/balance_controller.dart';
import 'package:elder_eate/screens/main/dailyEat/dailyEat.dart';
import 'package:elder_eate/screens/main/home/body.dart';
import 'package:elder_eate/screens/main/searchFood.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  final int currentPage;
  const Home({Key? key, required this.currentPage}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  NutritionBalanceController _balanceController =
      Get.put(NutritionBalanceController());
  int currentPage = 0;
  List<Tab> tabs = [
    Tab(
      text: "หน้าหลัก",
      icon: Icon(Icons.home),
    ),
    Tab(
      text: "ถ่ายอาหาร",
      icon: Icon(Icons.photo_camera),
    ),
    Tab(
      text: "ประวัติการกิน",
      icon: Icon(Icons.restaurant),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: tabs.length,
      initialIndex: widget.currentPage,
      child: Scaffold(
        bottomNavigationBar: menu(),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            HomeBody(),
            SearchFood(),
            DailyEat(),
          ],
        ),
      ),
    );
  }

  Widget menu() {
    return Container(
      color: pHeaderTabColor,
      child: TabBar(indicatorColor: Colors.white, tabs: tabs),
    );
  }
}
