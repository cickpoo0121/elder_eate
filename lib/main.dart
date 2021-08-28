import 'package:elder_eate/constant.dart';
import 'package:elder_eate/screens/home/home.dart';
import 'package:elder_eate/screens/init/initpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      // home: Init(),
      initialRoute: '/Home',
      routes: {
        '/Init': (context) => Init(),
        '/Home': (context) => Home(),
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
        // fontFamily: 'Lobster',
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
