import 'package:elder_eate/constant.dart';
import 'package:elder_eate/screens/dailyEat/body.dart';
import 'package:elder_eate/screens/dailyEat/dailyEat.dart';
import 'package:elder_eate/screens/home/body.dart';
import 'package:elder_eate/screens/main/camera.dart';
import 'package:elder_eate/screens/main/searchFood.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: menu(),
        body: TabBarView(children: [
          HomeBody(),
          SearchFood(),
          DailyEat(),
        ]),
      ),
    );
  }

  Widget menu() {
    return Container(
      color: pHeaderTabColor,
      child: TabBar(indicatorColor: Colors.white, tabs: [
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
      ]),
    );
  }
}
