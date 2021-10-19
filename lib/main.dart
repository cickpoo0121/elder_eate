import 'package:elder_eate/constant.dart';
import 'package:elder_eate/screens/dailyEat/dailyEat.dart';
import 'package:elder_eate/screens/food/addMeal.dart';
import 'package:elder_eate/screens/food/foodDetail.dart';
import 'package:elder_eate/screens/foodRecommend/foodRecommend.dart';
import 'package:elder_eate/screens/home/body.dart';
import 'package:elder_eate/screens/home/home.dart';
import 'package:elder_eate/screens/init/disease.dart';
import 'package:elder_eate/screens/init/individual.dart';
import 'package:elder_eate/screens/init/initpage.dart';
import 'package:elder_eate/screens/init/progress.dart';
import 'package:elder_eate/screens/init/username.dart';
import 'package:elder_eate/screens/init/weighHeight.dart';
import 'package:elder_eate/screens/main/searchFood.dart';
import 'package:elder_eate/screens/main/camera.dart';
import 'package:elder_eate/screens/main/profile.dart';
import 'package:elder_eate/service/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LineSDK.instance.setup('1655779489').then((_) {
    print('LineSDK Prepared');
  });

  final result, home;
  result = await ElderEatDatabase.instance.loadUser();
  print(result);
  if (result.length == 0) {
    home = '/Init';
  } else {
    home = '/Home';
  }

  runApp(
    ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          // home: Init(),
          initialRoute: '/Init',
          routes: {
            '/Init': (context) => Init(),
            '/Username': (context) => Username(),
            '/WeighHeight': (context) => WeighHeight(),
            '/Disease': (context) => Disease(),
            '/Progress': (context) => Progress(),
            '/Individual': (context) => Individual(),
            '/Home': (context) => Home(
                  currentPage: 0,
                ),
            '/HomeBody': (context) => HomeBody(),
            '/FoodDetail': (context) => FoodDetail(),
            '/AddMeal': (context) => AddMeal(),
            '/DailyEat': (context) => DailyEat(),
            '/Profile': (context) => Profile(),
            '/Camera': (context) => Camera(),
            '/SearchFood': (context) => SearchFood(),
            '/FoodRecommend': (context) => FoodRecommend(),
          },
          theme: ThemeData(
            // primaryColor: Colors.red,
            scaffoldBackgroundColor: pBackgroundColor,
            // accentColor: Colors.red[900],
            // canvasColor: Colors.green,
            appBarTheme: AppBarTheme(
              backgroundColor: pHeaderTabColor,
              iconTheme: IconThemeData(color: Colors.black),

              // set backbutton color here which will reflect in all screens.
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  primary: pButtonTxtColor,
                  backgroundColor: pButtonColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            // elevatedButtonTheme: ElevatedButtonThemeData(
            //   style: TextButton.styleFrom(
            //       primary: pButtonTxtColor,
            //       backgroundColor: pButtonColor,
            //       shape: CircleBorder()),
            // ),
            fontFamily: 'IBMPlexSansThai',
            textTheme: TextTheme(
              // Title page
              headline1: TextStyle(
                fontSize: 25.0.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),

              // Text Nomal purple
              headline2: TextStyle(
                fontSize: 20.0.sp,
                fontWeight: FontWeight.bold,
                color: pDetailTxtColor,
              ),

              // Text Nomal black
              headline3: TextStyle(
                fontSize: 20.0.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),

              // Text information user register/profile
              headline4: TextStyle(
                fontSize: 19.0.sp,
                fontWeight: FontWeight.bold,
                color: pRegisTxtColor,
              ),

              // Text on button
              headline5: TextStyle(
                fontSize: 22.0.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),

              headline6: TextStyle(
                fontSize: 20.0.sp,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    ),
  );
}
