import 'package:elder_eate/constant.dart';
import 'package:elder_eate/screens/food/addMeal.dart';
import 'package:elder_eate/screens/food/foodDetail.dart';
import 'package:elder_eate/screens/home/home.dart';
import 'package:elder_eate/screens/init/disease.dart';
import 'package:elder_eate/screens/init/individual.dart';
import 'package:elder_eate/screens/init/initpage.dart';
import 'package:elder_eate/screens/init/progress.dart';
import 'package:elder_eate/screens/init/username.dart';
import 'package:elder_eate/screens/init/weighHeight.dart';
import 'package:elder_eate/screens/main/searchFood.dart';
import 'package:elder_eate/screens/main/camera.dart';
import 'package:elder_eate/screens/main/foodRecommend.dart';
import 'package:elder_eate/screens/main/profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      // home: Init(),
      initialRoute: '/AddMeal',
      routes: {
        '/Init': (context) => Init(),
        '/Home': (context) => Home(),
        '/Food': (context) => FoodDetail(),
        '/AddMeal': (context) => WeighHeight(),
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

          // Title page
          headline1: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),

        // Text Nomal purple
          headline2: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: pDetailTxtColor,
          ),

        // Text Nomal black
          headline3: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),

          // Text information user register/profile
          headline4: TextStyle(
            fontSize: 19.0,
            fontWeight: FontWeight.bold,
            color: pRegisTxtColor,
          ),

          // Text on button
          headline5: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
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
