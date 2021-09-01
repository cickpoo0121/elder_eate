import 'package:elder_eate/constant.dart';
import 'package:elder_eate/screens/dailyEat/dailyEat.dart';
import 'package:elder_eate/screens/food/addMeal.dart';
import 'package:elder_eate/screens/food/foodDetail.dart';
import 'package:elder_eate/screens/home/home.dart';
import 'package:elder_eate/screens/init/initpage.dart';
import 'package:elder_eate/screens/init/progress.dart';
import 'package:elder_eate/screens/init/username.dart';
import 'package:elder_eate/screens/main/searchFood.dart';
import 'package:elder_eate/screens/main/camera.dart';
import 'package:elder_eate/screens/main/foodRecommend.dart';
import 'package:elder_eate/screens/main/profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      // home: Init(),
      initialRoute: '/Home',
      routes: {
        '/Init': (context) => Init(),
        '/Home': (context) => Home(),
        '/FoodDetail': (context) => FoodDetail(),
        '/AddMeal': (context) => AddMeal(),
        '/DailyEat': (context) => DailyEat(),
      },
      theme: ThemeData(
        // primaryColor: Colors.red,
        scaffoldBackgroundColor: pBackgroundColor,
        // accentColor: Colors.red[900],
        // canvasColor: Colors.green,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              primary: pButtonTxtColor,
              backgroundColor: pButtonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
              primary: pButtonTxtColor,
              backgroundColor: pButtonColor,
              shape: CircleBorder()),
        ),
        fontFamily: 'IBMPlexSansThai',
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 20.0,
            color: Color(0xff027bfe),
          ),
          headline2: TextStyle(
            fontSize: 20.0,
            color: Color(0xFF4FAEDD),
          ),
          headline3: TextStyle(
            fontSize: 20.0,
            color: Colors.grey[900],
          ),
          headline4: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
          headline5: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
          headline6: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
