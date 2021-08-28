import 'package:elder_eate/constant.dart';
import 'package:elder_eate/screens/home/body.dart';
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
        appBar: AppBar(
          centerTitle: true,
          // backgroundColor: pBackgroundColor,
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          title: Text(
            'เพิ่มมื้ออาหารของคุณ',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(
                Icons.account_circle,
                color: Colors.black,
                size: size.width * 0.08,
              ),
            ),
          ],
        ),
        bottomNavigationBar: menu(),
        body: TabBarView(children: [
          Home_body(),
          Home_body(),
          Home_body(),
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
