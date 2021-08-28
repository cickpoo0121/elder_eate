import 'package:elder_eate/constant.dart';
import 'package:elder_eate/screens/init/WeighHeight.dart';
import 'package:elder_eate/screens/init/disease.dart';
import 'package:elder_eate/screens/init/individual.dart';
import 'package:elder_eate/screens/init/initpage.dart';
import 'package:elder_eate/screens/init/progress.dart';
import 'package:elder_eate/screens/init/username.dart';
import 'package:elder_eate/screens/main/addMeal.dart';
import 'package:elder_eate/screens/main/camera.dart';
import 'package:elder_eate/screens/main/foodRecommend.dart';
import 'package:elder_eate/screens/main/profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      // home: Init(),
      initialRoute: '/Init',
      routes: {
        '/Init': (context) => Profile(),
        // '/Home':(context)=>HomeScreen(),
      },
      theme: ThemeData(
        // primaryColor: Colors.red,
        scaffoldBackgroundColor: pBackgroundColor,
        // accentColor: Colors.red[900],
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              primary: pButtonTxtColor,
              backgroundColor: pButtonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
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
