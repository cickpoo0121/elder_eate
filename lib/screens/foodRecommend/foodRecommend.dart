import 'package:elder_eate/constant.dart';
import 'package:elder_eate/screens/foodRecommend/body.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FoodRecommend extends StatefulWidget {
  const FoodRecommend({Key? key}) : super(key: key);

  @override
  _FoodRecommendState createState() => _FoodRecommendState();
}

class _FoodRecommendState extends State<FoodRecommend> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: pHeaderTabColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
        backgroundColor: pHeaderTabColor,
        centerTitle: true,
        title: Text(
          'อาหารแนะนำ',
          style: Theme.of(context).textTheme.headline1,
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: size.height, minWidth: size.width),
            child: Container(
              decoration: BoxDecoration(
                color: pBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: pPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    FoodRecommendBody(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: size.width * 0.45,
        child: TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/Home');
          },
          child: Text(
            'กลั้บหน้าหลัก',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
