import 'package:flutter/material.dart';


void main() {
  runApp(
    MaterialApp(
      // home: Init(),
      initialRoute: '/Init',
      routes: {
        '/Init':(context)=>Init(),
        '/Home':(context)=>HomeScreen(),
      
      },
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        // scaffoldBackgroundColor: Colors.white,
        // accentColor: Colors.red[900],
        fontFamily: 'Lobster',
        textTheme: TextTheme(
          headline4: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          headline5: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
