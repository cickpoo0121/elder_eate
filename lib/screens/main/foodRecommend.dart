import 'package:elder_eate/constant.dart';
import 'package:flutter/material.dart';

class FoodRecommend extends StatefulWidget {
  const FoodRecommend({Key? key}) : super(key: key);

  @override
  _FoodRecommendState createState() => _FoodRecommendState();
}

class _FoodRecommendState extends State<FoodRecommend> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: pHeaderTabColor,
          title: const Text(
            'อาหารแนะนำ',
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.07,
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      color: sBackgroundColor),
                  height: size.height * 0.08,
                  width: size.width * 0.85,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.favorite,
                          color: Colors.pink,
                          size: 24.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text("มะม่วง"),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: size.height * 0.03,
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      color: sBackgroundColor),
                  height: size.height * 0.08,
                  width: size.width * 0.85,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.favorite,
                          color: Colors.pink,
                          size: 24.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text("ส้ม"),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: size.height * 0.03,
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      color: sBackgroundColor),
                  height: size.height * 0.08,
                  width: size.width * 0.85,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.favorite,
                          color: Colors.pink,
                          size: 24.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text("ฝรั่ง"),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: size.height * 0.07,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
